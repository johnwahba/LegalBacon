class CreateParagraphs < ActiveRecord::Migration
  def change
    create_table :paragraphs do |t|
      t.integer :paragraph_index_number
      t.text :text
      t.integer :opinion_id

      t.timestamps
    end
  end
end
