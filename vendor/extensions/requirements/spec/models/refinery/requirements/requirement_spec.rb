require 'spec_helper'

module Refinery
  module Requirements
    describe Requirement do
      describe "validations" do
        subject do
          FactoryGirl.create(:requirement,
          :language => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:language) { should == "Refinery CMS" }
      end
    end
  end
end
