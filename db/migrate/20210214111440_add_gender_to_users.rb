class AddGenderToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :gender, :string
    add_column :users, :profession_id, :integer
  end
end
