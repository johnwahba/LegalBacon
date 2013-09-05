class CreateCitations < ActiveRecord::Migration
  def change
    create_table :citations do |t|
      t.integer :cited_case_id
      t.integer :citing_case_id

      t.timestamps
    end
  end
end
