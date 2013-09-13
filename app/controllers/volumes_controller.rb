class VolumesController < ApplicationController
  def show
  	@cases = ScotusCase.where({volume: params[:volume_number]})
  	p params[:volume_number]
  end

  def index
  end
end
