module ApplicationHelper
	JUSTICE_NAME_REGEX_2 = /Justice([^(?:II)](?:Mc|VAN |O')?[A-Z]{2,100})(?:, Jr\.| II)?/i
	NAME_REGEX = /(?:Mc|VAN |O')?[A-Z]{2,100}/
	SCOTUS_CITATION_REGEX= /((?:24[5-9]|2[5-9][0-9]|[3-9][0-9]{2}) U\. ?S\. [0-9]{1,4})/
	SCOTUS_CITATION_CAPTURE= /(24[5-9]|2[5-9][0-9]|[3-9][0-9]{2}) U\. ?S\. ([0-9]{1,4})/
	OPINION_TYPE_DETECTION_REGEX= /concur|dissent|PER CURIAM|deliver|memo|no part/i

	def paragraph_author(paragraph)
		if paragraph.justice 
			paragraph.justice.name.delete(" ")
		else
			paragraph.paragraph_index_number
		end
	end

	def linkify(paragraph_text)
		split_paragraph= paragraph_text.split(SCOTUS_CITATION_REGEX)
		split_paragraph.map! do |fragment|
			if fragment =~ SCOTUS_CITATION_REGEX
				"<a href='#{case_url(*fragment.scan(SCOTUS_CITATION_CAPTURE)[0])}'> #{fragment}</a>"
			else
				fragment
			end
		end
		split_paragraph.join('')

	end

	def normalize_opinion_header(paragraph_text)
		justice_name = paragraph_text.scan(JUSTICE_NAME_REGEX_2).flatten
		opinion_type = paragraph_text.scan(OPINION_TYPE_DETECTION_REGEX)
		case opinion_type 
		when ["deliver"]
			opinion_type = ["'s majority opinion"]
		when ["concur"]
			opinion_type = ["'s concurrance"]
		when ["dissent"]
			opinion_type = ["'s dissent"]
		end
		unless justice_name.empty? || opinion_type.empty?
			return "Justice #{justice_name[0].titleize.delete(' ')}#{opinion_type[0]}"
		else
			return paragraph_text
		end
	end

				


end
