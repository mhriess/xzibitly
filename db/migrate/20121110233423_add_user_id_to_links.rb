class AddUserIdToLinks < ActiveRecord::Migration
  def change
    change_table :links do |t|
      t.references :user
    end
  end
end
