
class OpinionType < ActiveRecord::Base

  OPINION_TYPES = ['majority', 'concur', 'dissent', 'per curiam', 'no part', 'memo']
  attr_accessible :opinion_type
  def self.find_by_opinion_type(opinion_type)
  	p opinion_type
  	if OPINION_TYPES.select { |op_type| op_type =~ Regexp.new(opinion_type) }.empty?
  		super('majority')
  	else
  		super(opinion_type.downcase)
  	end
  end

end
