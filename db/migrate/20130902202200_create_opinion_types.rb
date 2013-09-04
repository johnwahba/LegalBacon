class CreateOpinionTypes < ActiveRecord::Migration
  def change
    create_table :opinion_types do |t|
      t.string :opinion_type

      t.timestamps
    end
  end
end
