class Citation < ActiveRecord::Base
  attr_accessible :cited_case_id, :paragraph_id, :start_link_text, :end_link_text

  belongs_to :paragraph



end
