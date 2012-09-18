module Refinery
  module Services
    module Admin
      class ServicesController < ::Refinery::AdminController

        crudify :'refinery/services/service',
                :title_attribute => 'technology', :xhr_paging => true

      end
    end
  end
end
