class AddInformationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :code, :number
    add_column :users, :firstname, :string
    add_column :users, :lastname , :string
  end
end
