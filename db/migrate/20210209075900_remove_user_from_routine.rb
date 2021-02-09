class RemoveUserFromRoutine < ActiveRecord::Migration[6.1]
  def change
    remove_reference :routines, :user, null: false, foreign_key: true
  end
end
