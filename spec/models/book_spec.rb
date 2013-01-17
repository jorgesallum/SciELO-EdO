require 'spec_helper'

describe Book do
  it { should respond_to(:organizer_id)}
  it { should respond_to(:coordinators) }
  it { should respond_to(:directors) }
  it { should respond_to(:organizers) }
  it { should respond_to(:published_at) }
  it { should respond_to(:subtitle) }
  it { should respond_to(:title) }  
  it { should respond_to(:uuid) } 

  context 'when validating' do
    it 'is invalid without an organizer' do
      book = build(:book, :organizer => nil)
      book.should_not be_valid
      book.should have(1).error_on(:organizer)
    end 

    it 'is invalid without an title' do
      book = build(:book, :title => nil)
      book.should_not be_valid
      book.should have(1).error_on(:title)
    end 
  end

  context '.set_uuid' do
    it 'should set instance uuid using a new Guid' do
      book = build(:book, :uuid => nil)
      book.send(:set_uuid)
      book.uuid.should_not be_nil
    end
  end

  context 'when saving' do
    it 'should trigger .set_uuid' do
      book = create(:book,  :uuid => nil)
      book.uuid.should_not be_nil
    end

    it 'should belongs to an organizer' do
      book = create(:book)
      book.organizer.should_not be_nil
      book.organizer.should be_an_instance_of(User)
    end
  end

  context '#find_by_uuid_or_id' do
    let(:book) {  create(:book) }

    it 'should find book by id' do
      Book.find_by_uuid_or_id(book.id).should_not be_nil
    end

    it 'should find book by uuid' do
        Book.find_by_uuid_or_id(book.uuid).should_not be_nil
    end
  end
  
end