class AddIndexToManyTables < ActiveRecord::Migration
  def change

  	add_index :paragraphs, :opinion_id

  	add_index :opinions, :case_id
  	add_index :opinions, :justice_id
  	add_index :opinions, :opinion_type_id
  	add_index :citations, :citing_case_id
  	add_index :citations, :cited_case_id

  end
end
