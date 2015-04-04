class AddToUsers1 < ActiveRecord::Migration
  def change
  	add_column :users, :hashed_password, :string, :default => nil
  	add_column :users, :confirm_token, :string
  	add_column :users, :type, :string
  	add_column :users, :email_confirmed, :boolean, :default => false
  end
end
