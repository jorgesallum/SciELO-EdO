class Project < ActiveRecord::Base
  before_save :create_book

  validates   :user,  presence: true

  belongs_to  :user
  belongs_to  :book

  private
  def create_book
    self.book = Book.new if book.nil?
  end
end
