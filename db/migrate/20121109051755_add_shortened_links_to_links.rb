class AddShortenedLinksToLinks < ActiveRecord::Migration
  def change
    change_table :links do |t|
      t.string :shortened_link
    end
  end
end
