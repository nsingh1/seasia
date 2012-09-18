module Refinery
  module Services
    class Service < Refinery::Core::BaseModel
      self.table_name = 'refinery_services'

      attr_accessible :technology, :position

      acts_as_indexed :fields => [:technology]

      validates :technology, :presence => true, :uniqueness => true
    end
  end
end
