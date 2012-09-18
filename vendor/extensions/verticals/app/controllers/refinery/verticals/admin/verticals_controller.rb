module Refinery
  module Verticals
    module Admin
      class VerticalsController < ::Refinery::AdminController

        crudify :'refinery/verticals/vertical', :xhr_paging => true

      end
    end
  end
end
