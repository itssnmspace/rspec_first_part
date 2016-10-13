class AddAuthorToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :user_id, :integer unless column_exists? :users, :user_id
    add_index :tickets, :user_id
  end
end