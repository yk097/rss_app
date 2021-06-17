class AddChannelIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :channel_id, :integer
  end
end
