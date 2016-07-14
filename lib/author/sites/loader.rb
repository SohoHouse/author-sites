module Author
  module Sites
    class Loader

      attr_reader :path
      def initialize(path)
        @path = path
      end

      def namespace
        name.classify
      end

      def key
        name.to_sym
      end

      def name
        path.basename.to_s.underscore
      end

      def view_path
        File.join(path, 'app', 'views')
      end

      def elements
        @elements ||= load_yaml_file(elements_file_path)
      end

      def page_layouts
        @page_layouts ||= load_yaml_file(page_layouts_file_path)
      end

      def elements_file_path
        File.join(path, 'config', 'elements.yml')
      end

      def page_layouts_file_path
        File.join(path, 'config', 'page_layouts.yml')
      end

      def renderers
        @renderers ||= {
          react: react_renderers
        }
      end

      def presenters
        @presenters ||= {
          element: element_presenter,
          page:    page_presenter
        }
      end

      def load_yaml_file(path)
        return [] unless ::File.exist?(path)
        ::YAML.load(ERB.new(File.read(path)).result) || []
      end

      private

        def element_presenter
          @element_presenter ||= Author::Sites::ClassLoader.new do |loader|
            loader.scope = [namespace, "Elements"]
          end
        end

        def page_presenter
          @page_presenter ||= Author::Sites::ClassLoader.new do |loader|
            loader.scope = [namespace, "Pages"]
            loader.classify = ->(object) { object.page_layout.classify }
          end
        end

        def react_renderers
          @react_renderers ||= Author::Sites::ClassLoader.new do |loader|
            loader.scope    = [namespace, "Elements", "React"]
            loader.suffix   = "Renderer"
            loader.classify = ->(object) { object.to_s.classify }
          end
        end

    end
  end
end