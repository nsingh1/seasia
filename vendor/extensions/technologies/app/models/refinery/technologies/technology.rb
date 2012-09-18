module Refinery
  module Technologies
    class Technology < Refinery::Core::BaseModel
      self.table_name = 'refinery_technologies'

      attr_accessible :language, :blurb, :position

      acts_as_indexed :fields => [:language, :blurb]

      validates :language, :presence => true, :uniqueness => true
    end
  end
end
