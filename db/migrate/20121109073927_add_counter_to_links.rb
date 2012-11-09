class AddCounterToLinks < ActiveRecord::Migration
  def change
    change_table :links do |t|
      t.integer :counter, :default => 0
    end
  end
end
