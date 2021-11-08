FactoryBot.define do
  factory :comment do
    body { "MyText" }
    user { nil }
    talk { nil }
    parent_id { 1 }
  end
end
