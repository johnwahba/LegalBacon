class ScotusCasesController < ApplicationController
	def show
		@case = ScotusCase.find_by_volume_and_start_page(params[:volume_number], params[:start_page])
		@navbar_links= [ { url: volume_url(params[:volume_number]), text: "Volume #{params[:volume_number]}" } ]
	end
end
