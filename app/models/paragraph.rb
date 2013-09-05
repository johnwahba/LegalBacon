class Paragraph < ActiveRecord::Base
  attr_accessible :paragraph_index_number, :text, :opinion_id

 
  has_many :citations

  has_one :case, 
  through: :opinion, 
  source: :case

  belongs_to :opinion

  accepts_nested_attributes_for :citations


end
