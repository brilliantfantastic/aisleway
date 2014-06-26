require 'test_helper'

describe Aisleway::Model::Entity do
  before do
    class Widget
      include Aisleway::Model::Entity
    end
  end

  it 'automatically gets an id attrribute reader defined' do
    Widget.new.must_respond_to :id
  end

  describe 'attributes' do
    let(:attributes) { [:attr_1, :attr_2] }

    it 'defines attributes' do
      Widget.send :attributes=, attributes
      Widget.attributes.must_equal attributes
    end
  end

  describe '#initialize' do
    before do
      class Book
        include Aisleway::Model::Entity
        self.attributes = :title, :author
      end

      class GoodBook < Book
      end
    end

    it 'accepts attributes' do
      book = Book.new(title: 'Helter Skelter', author: 'Vincent Bugliosi')
      book.instance_variable_get(:@title).must_equal 'Helter Skelter'
      book.instance_variable_get(:@author).must_equal 'Vincent Bugliosi'
    end

    it 'ignores unknown attributes' do
      book = Book.new(rating: 77)

      book.instance_variable_get(:@rating).must_be_nil
    end

    it 'accepts attributes for a sub-class' do
      book = GoodBook.new(title: 'No Easy Day', author: 'Mark Owen')
      book.instance_variable_get(:@title).must_equal 'No Easy Day'
      book.instance_variable_get(:@author).must_equal 'Mark Owen'
    end
  end
end
