require 'nokogiri'

#First the opinion types
opinion_types = ['majority', 'concur', 'dissent', 'per curiam', 'no part', 'memo']

opinion_types.each do |opinion_type|
  OpinionType.create!({opinion_type: opinion_type})
end


#Second the Justices


justices_page = Nokogiri::HTML(File.open("lib/tasks/wikiSCOTUSJustices.html"))

justices = justices_page.css('.jquery-tablesorter tr')[1..-1]

justices.each do |justice|
  dates = justice.css('td').to_a.map(&:text)[4].scan(/([0-9]{4}).([0-9]{4}|present)\(/)
  if dates.empty? # for one year term justices
    dates = justice.css('td').to_a.map(&:text)[4].scan(/([0-9]{4})([0-9]{4})/)
  end
  name = justice.css('td').to_a[1].css('[title]').text
  searchable_name = justice.css('td').to_a[1].css('[title]').text.scan(/((?:Mc|VAN |O')?[A-Z]{2,100})(?: II|, Jr|)/i)[-1][0]
  start_date = Date.new(dates[0][0].to_i)
  end_date = Date.new(dates[0][1].to_i)
  wiki_link = justice.css('a')[0]['href']
  Justice.create!({name: name, start_date: start_date,
                   end_date: end_date, wiki_link: wiki_link, searchable_name: searchable_name})
end


