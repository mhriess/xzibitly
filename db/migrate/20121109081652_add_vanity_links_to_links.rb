class AddVanityLinksToLinks < ActiveRecord::Migration
  def change
    add_column :links, :vanity_link, :string
  end
end
