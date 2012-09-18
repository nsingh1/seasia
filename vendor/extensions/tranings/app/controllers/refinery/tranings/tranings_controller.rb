module Refinery
  module Tranings
    class TraningsController < ::ApplicationController

      before_filter :find_all_tranings
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @traning in the line below:
        present(@page)
      end

      def show
        @traning = Traning.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @traning in the line below:
        present(@page)
      end

    protected

      def find_all_tranings
        @tranings = Traning.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/tranings").first
      end

    end
  end
end
