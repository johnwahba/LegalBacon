class Paragraph < ActiveRecord::Base
  attr_accessible :paragraph_index_number, :text

 
  has_many :citations

  belongs_to :opinion

  accepts_nested_attributes_for :citations


end
