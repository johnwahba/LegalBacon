module ApplicationHelper
	JUSTICE_NAME_REGEX_2 = /[A-Z \.]{2,100} ([^(?:II)](?:Mc|VAN |O')?[A-Z]{2,100})(?:, Jr\.| II)?$/i
	NAME_REGEX = /(?:Mc|VAN |O')?[A-Z]{2,100}/
	SCOTUS_CITATION_REGEX= /([24[5-9]|2[5-9][0-9]|[3-9][0-9]{2}] U\. ?S\. [0-9]{1,4})/
	SCOTUS_CITATION_CAPTURE= /([24[5-9]|2[5-9][0-9]|[3-9][0-9]{2})] U\. ?S\. ([0-9]{1,4})/
	OPINION_TYPE_DETECTION_REGEX= /concur|dissent|PER CURIAM|deliver|memo|no part/i

	def paragraph_author(paragraph)
		if paragraph.justice 
			paragraph.justice.name.delete(" ")
		else
			paragraph.paragraph_index_number
		end
	end

	def linkify(paragraph)
		split_paragraph= paragraph.split(SCOTUS_CITATION_REGEX)
		split_paragraph.map! do |fragment|
			if fragment =~ SCOTUS_CITATION_REGEX
				"<a href='#{case_url(*fragment.scan(SCOTUS_CITATION_CAPTURE)[0])}'> #{fragment}</a>"
			else
				fragment
			end
		end
		split_paragraph.join('')

	end


				


end
