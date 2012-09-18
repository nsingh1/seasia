
FactoryGirl.define do
  factory :requirement, :class => Refinery::Requirements::Requirement do
    sequence(:language) { |n| "refinery#{n}" }
  end
end

