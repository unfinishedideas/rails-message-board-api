class AddMessages < ActiveRecord::Migration[5.2]
  def change
    create_table(:messages) do |t|

      t.column(:title, :string)
      t.column(:content, :string)

      t.column(:group_id, :integer)
      t.column(:user_id, :integer)

      t.timestamps()
    end
  end
end
