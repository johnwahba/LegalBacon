class Justice < ActiveRecord::Base
  attr_accessible :end_date, :name, :start_date, :wiki_link

  def end_date=(end_date)
  	if end_date.year == 0 
  		super("")
  	else
  		super(end_date)
  	end
  end

end
