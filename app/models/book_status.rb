class BookStatus < ActiveRecord::Base

  after_commit :create_permissions, :on => :create

  attr_accessible :desc

  validates :desc,              :presence => true

  def self.default
    if BookStatus.all.size == 0
      b = BookStatus.new
      b.desc = "Em fila"
      b.save
    end
    BookStatus.all.first
  end

  def create_permissions
    Permission.create_for_book_status self
  end
end
