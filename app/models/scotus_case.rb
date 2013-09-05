class ScotusCase < ActiveRecord::Base
  attr_accessible :start_page, :volume, :date_heard, :case_name, :opinions_attributes

  has_many :opinions, :foreign_key => :case_id
  has_many :paragraphs, :through => :opinions, :source => :paragraphs 

  accepts_nested_attributes_for :opinions

  def case_name=(name)
  	name = name[0..254]
  	super(name)
  end


  
end
