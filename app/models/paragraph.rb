class Paragraph < ActiveRecord::Base
  attr_accessible :paragraph_index_number, :text, :opinion_id, :start_of_opinion

 
  has_many :citations

  has_one :case, 
  through: :opinion, 
  source: :case

  has_one :justice,
  through: :opinion,
  source: :justice

  belongs_to :opinion

  accepts_nested_attributes_for :citations


end
