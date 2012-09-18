
FactoryGirl.define do
  factory :vertical, :class => Refinery::Verticals::Vertical do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

