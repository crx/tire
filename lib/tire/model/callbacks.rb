module Tire
  module Model

    module Callbacks

      def self.included(base)
        if base.respond_to?(:after_save)
          base.send :after_save, :update_elastic_search_index
        end

        if base.respond_to?(:before_destroy)
          base.send :before_destroy, :remove_from_index
        end
      end

    end

  end
end
