require 'test_helper'

describe Aisleway::Model::Entity do
  before do
    class Widget
      include Aisleway::Model::Entity
    end
  end

  describe 'attributes' do
    let(:attributes) { [:attr_1, :attr_2] }

    it 'defines attributes' do
      Widget.send :attributes=, attributes
      Widget.attributes.must_equal attributes
    end
  end
end
