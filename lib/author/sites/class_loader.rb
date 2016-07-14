module Author
  module Sites
    class ClassLoader
    
      attr_accessor :scope, :default, :suffix, :classify

      def initialize(&block)
        yield(self)
      end

      def scope
        @scope || []
      end

      def suffix
        @suffix || "Presenter"
      end

      def default
        @default || "Base#{suffix}"
      end

      def classify
        @classify || ->(object) { object.name.classify }
      end

      def for(object)
        name = class_name(object)
        return registry[name] if registry[name]
        array = scope.dup << name
        klass = nil
        until class_defined?(klass) do
          klass = array.join('::')
          array.shift
          klass = default if array.empty?
        end
        registry[name] = klass.constantize
      end

      private

        def class_name(object)
          [classify.call(object), suffix].join
        end

        def registry
          @registry ||= {}
        end

        def class_defined?(klass)
          return if klass.nil?
          klass.constantize
        rescue NameError
          false
        end

    end
  end
end