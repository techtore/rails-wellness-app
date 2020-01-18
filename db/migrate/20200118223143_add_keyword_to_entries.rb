class AddKeywordToEntries < ActiveRecord::Migration[6.0]
  def change
    add_column :entries, :keyword, :string
  end
end
