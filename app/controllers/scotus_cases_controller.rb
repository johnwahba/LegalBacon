class ScotusCasesController < ApplicationController
	def show
		@case = ScotusCase.find_by_volume_and_start_page(params[:volume_number], params[:start_page])
	end
end
