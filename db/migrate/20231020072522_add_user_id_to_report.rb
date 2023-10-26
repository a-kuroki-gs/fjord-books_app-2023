class AddUserIdToReport < ActiveRecord::Migration[7.0]
  def change
    add_reference :reports, :user, foreign_key: true
  end
end
