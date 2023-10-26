class AddImageableIdToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :imageable_id, :bigint
    add_column :comments, :imageable_type, :string
  end
end
