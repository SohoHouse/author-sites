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

      def load_yaml_file(path)
        return [] unless ::File.exist?(path)
        ::YAML.load(ERB.new(File.read(path)).result) || []
      end

    end
  end
end