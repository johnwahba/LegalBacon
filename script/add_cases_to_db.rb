require 'nokogiri'
# Pass a folder with folders of cases as an ARGV
#Third the cases


JUSTICE_NAME_REGEX = /Justice (Mc|VAN )?[A-Z']{2,100}/
JUSTICE_ACTION_REGEX = /(, dissent|, concur| announce|,? deliver|, with|, Circuit|\.$)[a-z]*/
MEMORANDUM_REGEX =  /Memorandum.*#{JUSTICE_NAME_REGEX}/
OPINION_DETECTION_REGEX =/#{JUSTICE_NAME_REGEX}#{JUSTICE_ACTION_REGEX}[\. ]|PER CURIAM|#{MEMORANDUM_REGEX}/
SCOTUS_CITATION_REGEX= /[0-9]{1,4} U\. ?S\. [0-9]{1,4}/
OPINION_TYPE_DETECTION_REGEX= /concur|dissent|PER CURIAM|deliver|memo|no part/i

cases =  Dir[ARGV[0]+'/*/*']
# case1 = "../US/540/540.US.519.02-6320.html"

cases[44..64]	.each do |case1|
	next
	next if case1 =~ /index/
	case_page = Nokogiri::HTML(File.open(case1))
	p case1
	# p case_page.text
	paragraphs = case_page.css('p').map(&:text)

	header_paragraphs = []
	scotus_citations = []
	
	paragraphs.each do |paragraph| 
		header_paragraphs << paragraph  if paragraph =~ OPINION_DETECTION_REGEX
		if paragraph =~ SCOTUS_CITATION_REGEX
			scotus_citations << paragraph.scan(SCOTUS_CITATION_REGEX).flatten 
		end

	end

	scotus_citations.flatten!.map! do |citation| 
		#NORMALIZE CITATIONS
		citation.gsub("U. S.", "U.S.")
	end
	p "volume:" + case_page.css('.case_cite')[0].text.split[0]
	p "start_page:" + case_page.css('.case_cite')[0].text.split[2]
	p "date_heard:" + case_page.css('.date')[-1].text.scan(/(.*)/)[0][0] 
	p "case_name:" + case_page.css('.parties')[0].text

	p "citations:" + scotus_citations.to_s
end


cases[0..0].each do |case_dir|
	next if case_dir =~ /index/
	p case_dir
	
	case_page = Nokogiri::HTML(File.open(case_dir))
	volume = case_page.css('.case_cite')[0].text.split[0]
	start_page = case_page.css('.case_cite')[0].text.split[2]
	date_heard = case_page.css('.date')[-1].text.scan(/(.*)/)[0][0] 
	case_name = case_page.css('.parties')[0].text
	
	paragraph_text_array = case_page.css('p').map(&:text)
	
	current_opinion_object = {opinion_type_id: nil, paragraphs_attributes: []}
	
	opinions_attributes = []
	paragraphs_attributes = []
	opinion_type_id = nil
	
	paragraph_text_array.each_with_index do |paragraph_text, idx|

		if paragraph_text =~ OPINION_DETECTION_REGEX

			current_opinion_object = { opinion_type_id: opinion_type_id, 
																 paragraphs_attributes: paragraphs_attributes }
			opinions_attributes << current_opinion_object
			opinion_type_id = OpinionType.find_by_opinion_type(paragraph_text.scan(OPINION_TYPE_DETECTION_REGEX)[0]).id

			paragraphs_attributes = []
		end

		current_paragraph_object = {paragraph_index_number: idx,
															  text: paragraph_text}
		paragraphs_attributes << current_paragraph_object
	end
	p paragraphs_attributes.length

	case_object = ScotusCase.new({volume: volume, start_page: start_page, date_heard: date_heard,
													case_name: case_name, opinions_attributes: opinions_attributes})

p case_object
end



#Finally the citations

# ScotusCase.new({:volumet => , 