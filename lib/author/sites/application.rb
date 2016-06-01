module Author
  module Sites
    module Application
      extend ActiveSupport::Concern

      included do
        config.sites = {}

        config.to_prepare do
          ::Alchemy::Element.send(:extend, Author::Sites.extensions)

          Rails.application.config.sites.values.each do |site|
            site.elements.each     { |element| Alchemy::Element.add(element)   }
            site.page_layouts.each { |layout|  Alchemy::PageLayout.add(layout) }
          end
        end
      end

    end
  end
end
