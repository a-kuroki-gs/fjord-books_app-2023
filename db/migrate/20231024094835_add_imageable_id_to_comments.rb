class AddImageableIdToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :report, foreign_key: true
    add_reference :comments, :book, foreign_key: true
  end
end
