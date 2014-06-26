require 'test_helper'

describe Aisleway::Model::Entity do
  before do
    class Widget
      include Aisleway::Model::Entity
    end

    class Book
      include Aisleway::Model::Entity
      self.attributes = :title, :author
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
      class GoodBook < Book
      end

      class Computer
        include Aisleway::Model::Entity
        attr_accessor :hard_drive_size
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

    it 'can initialize without any attributes' do
      computer = Computer.new
      computer.hard_drive_size.must_be_nil
    end

    it 'can initialize with attributes outside of Aisleway' do
      computer = Computer.new(hard_drive_size: '32g')
      computer.hard_drive_size.must_equal '32g'
    end

    it 'raises an error when the given attributes don\'t correspond to a known accessor' do
      -> { Computer.new(flash_hard_drive: true) }.must_raise(NoMethodError)
    end
  end

  describe 'accessors' do
    it 'exposes getters for attributes' do
      book = Book.new(title: 'The Hatchet')
      book.title.must_equal 'The Hatchet'
    end

    it 'exposes setters for attributes' do
      book = Book.new
      book.title = 'A Tale of Two Cities'
      book.title.must_equal 'A Tale of Two Cities'
    end
  end

  describe 'equality' do
    before do
      @book1  = Book.new
      @book1.id = 23

      @book2  = Book.new
      @book2.id = 23

      @book3  = Book.new
      @widget = Widget.new
      @widget.id = 23
    end

    it 'returns true if they have the same class and id' do
      @book1.must_equal @book2
    end

    it 'returns false if they have the same class but different id' do
      @book1.wont_equal @book3
    end

    it 'returns false if they have different class' do
      @book1.wont_equal @widget
    end
  end
end
