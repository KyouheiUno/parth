class DeleteProfessionNameUniqIndexFromProfession < ActiveRecord::Migration[6.1]
    def change
      remove_index :professions, :profession_name
    end
end
