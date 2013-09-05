class ScotusCase < ActiveRecord::Base
  attr_accessible :start_page, :volume, :date_heard, :case_name, :opinions_attributes

  has_many :opinions, :foreign_key => :case_id
  has_many :paragraphs, :through => :opinions, :source => :paragraphs 

  has_many :outbound_citations, foreign_key: :citing_case_id, class_name: "Citation"
  has_many :inbound_citations, foreign_key: :cited_case_id, class_name: "Citation"

  accepts_nested_attributes_for :opinions

  def case_name=(name)
  	name = name[0..254]
  	super(name)
  end


  
end
