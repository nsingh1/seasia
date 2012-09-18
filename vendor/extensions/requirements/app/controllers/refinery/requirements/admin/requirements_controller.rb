module Refinery
  module Requirements
    module Admin
      class RequirementsController < ::Refinery::AdminController

        crudify :'refinery/requirements/requirement',
                :title_attribute => 'language', :xhr_paging => true

      end
    end
  end
end
