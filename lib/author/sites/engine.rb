module Author
  module Sites
    module Engine
      extend ActiveSupport::Concern

      included do
        config.before_initialize do
          Rails.application.config.sites[loader.key] = loader
        end
      end


      def loader
        @loader ||= Author::Sites::Loader.new(root)
      end


    end
  end
end
