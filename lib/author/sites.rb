require 'active_support/concern'

require "author/sites/version"
require "author/sites/loader"
require "author/sites/alchemy/extensions"
require "author/sites/engine"
require "author/sites/application"
require "author/sites/controller"

module Author
  module Sites
    module_function

    def engine
      Author::Sites::Engine
    end

    def extensions
      Author::Sites::Alchemy::Extensions
    end

    def application
      Author::Sites::Application
    end

    def controller
      Author::Sites::Controller
    end

    def sites
      @sites ||= {}
    end

  end
end
