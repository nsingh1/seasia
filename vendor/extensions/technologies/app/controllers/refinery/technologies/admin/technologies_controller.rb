module Refinery
  module Technologies
    module Admin
      class TechnologiesController < ::Refinery::AdminController

        crudify :'refinery/technologies/technology',
                :title_attribute => 'language', :xhr_paging => true

      end
    end
  end
end
