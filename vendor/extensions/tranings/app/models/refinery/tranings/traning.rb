module Refinery
  module Tranings
    class Traning < Refinery::Core::BaseModel
      self.table_name = 'refinery_tranings'

      attr_accessible :title, :blurb, :date, :position

      acts_as_indexed :fields => [:title, :blurb]

      validates :title, :presence => true, :uniqueness => true
    end
  end
end
