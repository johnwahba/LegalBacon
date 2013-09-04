class CreateCitations < ActiveRecord::Migration
  def change
    create_table :citations do |t|
      t.integer :cited_case_id
      t.integer :paragraph_id
      t.integer :start_link_text
      t.integer :end_link_text

      t.timestamps
    end
  end
end
