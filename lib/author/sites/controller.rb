module Author
  module Sites
    module Controller
      extend ActiveSupport::Concern
      
      included do
        before_action do
          prepend_view_path(current_site.view_path) if current_site.view_path
        end

        helper_method def current_site
          @current_site ||= SitePresenter.new(current_alchemy_site)
        end
      end

    end
  end
end
