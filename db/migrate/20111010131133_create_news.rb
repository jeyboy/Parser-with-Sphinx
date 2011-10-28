class CreateNews < ActiveRecord::Migration
  def change
    create_table :news_items do |t|
      t.string :title
      t.text :body
      t.timestamps
      t.integer :topic_id
    end
  end
end
