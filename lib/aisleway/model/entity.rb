module Aisleway
  module Model
    module Entity
      def self.included(base)
        base.extend ClassMethods
        base.send :attr_reader, :id
      end

      module ClassMethods
        def attributes=(*attributes)
          @attributes = attributes.flatten

          class_eval %{
            def initialize(attributes = {})
              #{ @attributes.map {|a| "@#{a}" }.join(', ') }, = *attributes.values_at(#{ @attributes.map {|a| ":#{a}"}.join(', ') })
            end
          }

          attr_accessor *@attributes
        end

        def attributes
          @attributes
        end
      end

      def initialize(attributes={})
        attributes.each do |name, value|
          public_send "#{name}=", value
        end
      end
    end
  end
end
