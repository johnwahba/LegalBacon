class JusticeController < ApplicationController
  def show
  	@justice = Justice.find(params[:justice_id])
  	majoritys, concurs, dissents, per_curiams, memos = [],[],[],[],[]
  	query = <<-SQL
  		SELECT scotus_cases.*, opinion_types.opinion_type, opinions.id AS opinion_id
		FROM justices 
		JOIN opinions 
			ON opinions.justice_id = justices.id
		JOIN scotus_cases
			ON opinions.case_id = scotus_cases.id
		JOIN opinion_types
			ON opinions.opinion_type_id = opinion_types.id
		WHERE justices.id = ? 
		SQL

  	cases = ScotusCase.find_by_sql [query, params[:justice_id]]

  	cases.each do |scotus_case| 
   		opinion_type = scotus_case.opinion_type
  		case opinion_type
  		when "majority"
  			majoritys << scotus_case
  		when "concur"
  			concurs << scotus_case
  		when "dissent"
  			dissents << scotus_case
  		when "memos"
  			memos << scotus_case
  		end
  	end

  	@opinions = {"Majority Opinions" => majoritys,
  				 "Concurrances" => concurs,
  				 "Dissents" => dissents,
  				 "Memos" => memos}

  end

  def index
  	@justices = Justice.all
  end

end
