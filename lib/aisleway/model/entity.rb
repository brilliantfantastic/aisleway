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

          attr_accessor *@attributes
        end

        def attributes
          @attributes
        end
      end
    end
  end
end
