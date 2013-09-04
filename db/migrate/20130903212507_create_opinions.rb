class CreateOpinions < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.integer :opinion_type_id
      t.integer :case_id
      t.integer :justice_id

      t.timestamps
    end
  end
end
