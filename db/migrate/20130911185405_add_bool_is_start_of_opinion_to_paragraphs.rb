class AddBoolIsStartOfOpinionToParagraphs < ActiveRecord::Migration
  def change
  	add_column :paragraphs, :start_of_opinion, :boolean, default: false
  end
end
