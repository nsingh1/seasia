module Refinery
  module Requirements
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Requirements

      engine_name :refinery_requirements

      initializer "register refinerycms_requirements plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "requirements"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.requirements_admin_requirements_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/requirements/requirement',
            :title => 'language'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Requirements)
      end
    end
  end
end
