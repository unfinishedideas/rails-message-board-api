class AddForeignKeys < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :messages, :users
    add_foreign_key :messages, :groups
  end
end
