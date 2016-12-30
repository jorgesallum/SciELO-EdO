class Project < ActiveRecord::Base
  before_save :create_book

  validates   :user,  presence: true

  belongs_to  :user
<<<<<<< HEAD
  belongs_to  :book, dependent: :destroy
=======
  belongs_to  :book
>>>>>>> master

  private
  def create_book
    self.book = Book.new if book.nil?
  end
end
