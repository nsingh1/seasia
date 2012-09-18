
FactoryGirl.define do
  factory :service, :class => Refinery::Services::Service do
    sequence(:technology) { |n| "refinery#{n}" }
  end
end

