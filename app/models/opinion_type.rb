
class OpinionType < ActiveRecord::Base
  attr_accessible :opinion_type

  OPINION_TYPES = ['majority', 'concur', 'dissent', 'per curiam', 'no part', 'memo']

  def self.find_by_opinion_type(opinion_type)
  	if !opinion_type || OPINION_TYPES.select { |op_type| op_type =~ Regexp.new(opinion_type) }.empty?
  		super('majority')
  	else
  		super(opinion_type.downcase)
  	end
  end

end
