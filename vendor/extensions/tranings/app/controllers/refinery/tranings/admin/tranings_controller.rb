module Refinery
  module Tranings
    module Admin
      class TraningsController < ::Refinery::AdminController

        crudify :'refinery/tranings/traning', :xhr_paging => true

      end
    end
  end
end
