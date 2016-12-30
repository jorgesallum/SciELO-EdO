class AddTitleToBooks < ActiveRecord::Migration
  def change
    add_column :books, :title, :string, default: 'No Title'
  end
end
