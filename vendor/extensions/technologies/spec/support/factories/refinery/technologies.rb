
FactoryGirl.define do
  factory :technology, :class => Refinery::Technologies::Technology do
    sequence(:language) { |n| "refinery#{n}" }
  end
end

