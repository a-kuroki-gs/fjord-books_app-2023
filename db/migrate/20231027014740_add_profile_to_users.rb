class AddProfileToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :post_code, :string, null: false
    add_column :users, :address, :string, null: false
    add_column :users, :self_introduction, :text, null: false
  end
end
