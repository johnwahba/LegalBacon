module ApplicationHelper
	JUSTICE_NAME_REGEX_2 = /[A-Z \.]{2,100} ([^(?:II)](?:Mc|VAN |O')?[A-Z]{2,100})(?:, Jr\.| II)?$/i
	NAME_REGEX = /(?:Mc|VAN |O')?[A-Z]{2,100}/
	SCOTUS_CITATION_REGEX= /[0-9]{1,4} U\. ?S\. [0-9]{1,4}/
	OPINION_TYPE_DETECTION_REGEX= /concur|dissent|PER CURIAM|deliver|memo|no part/i

	def linkify_justice_name(string)
		string.scan(JUSTICE_NAME_REGEX_2)
		justice_name = Justice.find_by_searchable_name(string.scan(JUSTICE_NAME_REGEX_2)[0][0]) if string.scan(JUSTICE_NAME_REGEX_2)[0]
		string.gsub!(JUSTICE_NAME_REGEX_2) { |j| j.gsub!( string, "<a href='#{justice_url(justice_name)}'> #{string} </a>") } if justice_name
	end

	def linkify_case_name(case_object)
		"<a href='#{case_url(case_object.volume, case_object.start_page)}'> #{case_object.case_name} </a>"
	end

end
