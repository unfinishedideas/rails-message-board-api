class AddUsers < ActiveRecord::Migration[5.2]
  def change
    create_table(:users) do |t|
      t.column(:user_name, :string)

      t.column(:admin, :boolean, default: false)
      t.timestamps()
    end
  end
end
