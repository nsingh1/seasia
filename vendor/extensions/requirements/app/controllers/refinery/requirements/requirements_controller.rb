module Refinery
  module Requirements
    class RequirementsController < ::ApplicationController

      before_filter :find_all_requirements
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @requirement in the line below:
        present(@page)
      end

      def show
        @requirement = Requirement.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @requirement in the line below:
        present(@page)
      end

    protected

      def find_all_requirements
        @requirements = Requirement.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/requirements").first
      end

    end
  end
end
