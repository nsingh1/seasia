module Refinery
  module Verticals
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Verticals

      engine_name :refinery_verticals

      initializer "register refinerycms_verticals plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "verticals"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.verticals_admin_verticals_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/verticals/vertical'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Verticals)
      end
    end
  end
end
