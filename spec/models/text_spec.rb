require 'spec_helper'

describe Text do
  it { should respond_to(:book_id) }
  it { should respond_to(:content) }
  it { should respond_to(:title) }
  it { should respond_to(:uuid) }
  it { should respond_to(:content) }


  context 'when validating' do
    it 'is invalid without a book_id' do
      text = build(:text, :book_id => nil)
      text.should_not be_valid
      text.should have(1).error_on(:book_id)
    end 

    it 'is invalid without a title' do
      text = build(:text, :title => nil)
      text.should_not be_valid
      text.should have(1).error_on(:title)
    end 

  end

  context 'when saving' do
    it 'should trigger .set_uuid' do
      text = create(:text, :uuid => nil)
      text.uuid.should_not be_nil
    end

    it 'should belongs to a book' do
      text = create(:text)
      text.book.should_not be_nil
      text.book.should be_an_instance_of(Book)
    end    
  end

   context '.set_uuid' do
    it 'should set instance uuid using a new Guid' do
      text = build(:text, :uuid => nil)
      text.send(:set_uuid)
      text.uuid.should_not be_nil
    end
  end

  context '#find_by_uuid_or_id' do
    let(:text) {  create(:text) }

    it 'should find text by id' do
      Text.find_by_uuid_or_id(text.id).should_not be_nil
    end

    it 'should find text by uuid' do
        Text.find_by_uuid_or_id(text.uuid).should_not be_nil
    end
  end

end
