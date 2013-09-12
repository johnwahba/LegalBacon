module ApplicationHelper
	JUSTICE_NAME_REGEX_2 = /[A-Z \.]{2,100} ([^(?:II)](?:Mc|VAN |O')?[A-Z]{2,100})(?:, Jr\.| II)?$/i
	NAME_REGEX = /(?:Mc|VAN |O')?[A-Z]{2,100}/
	SCOTUS_CITATION_REGEX= /[0-9]{1,4} U\. ?S\. [0-9]{1,4}/
	OPINION_TYPE_DETECTION_REGEX= /concur|dissent|PER CURIAM|deliver|memo|no part/i

	def paragraph_author(paragraph)
		if paragraph.justice 
			paragraph.justice.name.delete(" ")
		else
			paragraph.paragraph_index_number
		end
	end

				


end
