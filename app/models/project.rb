class Project < ActiveRecord::Base
  before_save :create_book

  validates   :user,  presence: true

  belongs_to  :user
  belongs_to  :book, dependent: :destroy

  def add_upload_file(file)
    cs_path = File.join(Rails.root,'cs.json')
    c_path = File.join(Rails.root,'c.yaml')
    hgdoc = Hgdoc::GoogleConnector.new(cs_path, c_path)

    upload = file
    filepath = Rails.root.join('/tmp', upload.original_filename)
    File.open(filepath, 'wb') do |file|
      file.write(upload.read)
    end
    
    google_filedocument_id = hgdoc.upload(filepath.to_s)
    hgdoc.download_as_html(google_filedocument_id)
  end

  private
  def create_book
    self.book = Book.new if book.nil?
  end
end
