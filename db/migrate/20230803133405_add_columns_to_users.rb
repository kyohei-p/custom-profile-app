class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :self_introduction, :string
    add_column :users, :avater, :string #仮でstring指定
  end
end
