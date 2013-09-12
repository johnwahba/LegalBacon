#First fix up Harlan and his annoying offspring
JUSTICE_NAME_REGEX = /Justice (?:Mc|VAN |O')?[A-Z]{2,100}/
SCOTUS_CITATION_REGEX= /(24[5-9]|2[5-9][0-9]|[3-9][0-9]{2}) U\. ?S\. ([0-9]{1,4})/

justice_fix = [["rutledge", 85], ["marshall", 98], ["harlan", 91]]

justice_fix.each do |name_of_old, id_of_new|
    Justice.find_by_searchable_name(name_of_old).opinions.each do |opinion|
    		opinion.justice_id = id_of_new # Other justice's id
    		opinion.save!
    end
end

#Then generate citations
p_count = Paragraph.count

Paragraph.all.each_with_index do |paragraph, idx|

	citations = paragraph.text.scan(SCOTUS_CITATION_REGEX)
	citations.each do |citation|
    	cited_case = ScotusCase.find_by_volume_and_start_page(*citation)
    	citing_case = paragraph.case 
    	if cited_case && cited_case.id != citing_case.id
    		a = Citation.create({cited_case_id: cited_case.id, citing_case_id: citing_case.id})
    		if a.id && a.id % 100 == 0
                p idx.to_s + "/" + p_count.to_s + "Citation number:" + a.id.to_s
            end
    	end

	end
end


