class Citation < ActiveRecord::Base
  attr_accessible :cited_case_id, :citing_case_id
	validates :citing_case_id, :uniqueness => {:scope => :citing_case_id}
  belongs_to :paragraph



end
