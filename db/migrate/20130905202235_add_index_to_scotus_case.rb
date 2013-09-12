class AddIndexToScotusCase < ActiveRecord::Migration
  def change
  	add_index :scotus_cases, [:volume, :start_page]


  end
end
