class CreateScotusCases < ActiveRecord::Migration
  def change
    create_table :scotus_cases do |t|
      t.integer :volume
      t.integer :start_page
      t.date :date_heard
      t.string :case_name

      t.timestamps
    end
  end
end
