class AddBookToProject < ActiveRecord::Migration
  def change
    add_column  :projects, :book_id,  :integer
  end
end
