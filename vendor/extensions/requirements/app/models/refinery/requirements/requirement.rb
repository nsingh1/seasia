module Refinery
  module Requirements
    class Requirement < Refinery::Core::BaseModel
      self.table_name = 'refinery_requirements'

      attr_accessible :language, :blurb, :position

      acts_as_indexed :fields => [:language, :blurb]

      validates :language, :presence => true, :uniqueness => true
    end
  end
end
