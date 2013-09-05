class CreateJustices < ActiveRecord::Migration
  def change
    create_table :justices do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.string :wiki_link
      t.string :searchable_name

      t.timestamps
    end
  end
end
