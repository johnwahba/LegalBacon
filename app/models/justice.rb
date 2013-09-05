class Justice < ActiveRecord::Base
  attr_accessible :end_date, :name, :start_date, :wiki_link, :searchable_name

  has_many :opinions

  def searchable_name=(name)
  	name = (name.downcase)
  	super(name)
  end


  def self.find_by_searchable_name(name)
  	super(name.downcase)
  end


  def end_date=(end_date)
  	if end_date.year == 0 
  		super("")
  	else
  		super(end_date)
  	end
  end



end
