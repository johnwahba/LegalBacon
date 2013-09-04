class Opinion < ActiveRecord::Base
  attr_accessible :case_id, :opinion_type_id, :paragraphs_attributes, :justice_id

  has_many :paragraphs

  belongs_to :justice


  accepts_nested_attributes_for :paragraphs

end
