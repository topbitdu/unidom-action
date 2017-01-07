module Unidom
  module Action

    class Engine < ::Rails::Engine

      include Unidom::Common::EngineExtension

      isolate_namespace ::Unidom::Action

      enable_initializer enum_enabled: true, migration_enabled: true

    end

  end
end
