class Citation < ActiveRecord::Base
  attr_accessible :cited_case_id, :citing_case_id
	validates :cited_case_id, :uniqueness => {:scope => :citing_case_id}

	belongs_to :citing_case, class_name: "ScotusCase", foreign_key: :citing_case_id
	belongs_to :cited_case, class_name: "ScotusCase", foreign_key: :cited_case_id
	
end
