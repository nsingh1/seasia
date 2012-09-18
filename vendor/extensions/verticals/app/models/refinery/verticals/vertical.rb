module Refinery
  module Verticals
    class Vertical < Refinery::Core::BaseModel
      self.table_name = 'refinery_verticals'

      attr_accessible :title, :blurb, :position

      acts_as_indexed :fields => [:title, :blurb]

      validates :title, :presence => true, :uniqueness => true
    end
  end
end
