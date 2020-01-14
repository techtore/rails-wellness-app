class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.datetime :date
      t.text :content
      t.integer :user_id
      t.integer :topic_id

      t.timestamps
    end
  end
end
