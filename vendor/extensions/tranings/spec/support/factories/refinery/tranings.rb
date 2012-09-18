
FactoryGirl.define do
  factory :traning, :class => Refinery::Tranings::Traning do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

