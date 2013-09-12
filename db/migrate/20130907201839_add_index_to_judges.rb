class AddIndexToJudges < ActiveRecord::Migration
  def change
  	add_index :justices, :searchable_name
  end
end
