class AddIndexProfessionNameToProfessions < ActiveRecord::Migration[6.1]
  def change
    add_index :professions, :profession_name, unique: true
  end
end
