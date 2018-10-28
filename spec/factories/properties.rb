FactoryBot.define do
  factory :property do
    name { FFaker::Lorem.sentence }
    description { FFaker::Lorem.paragraph }
    published { true }
    provider { 'trovit' }
    sequence(:external_id) { |n| "1234b-#{n}" }
    property_type { 'Casa' }
    price { 1_000 }
    floor_area { 10 }
    rooms { 2 }
    bathrooms { 1 }
    city { 'CDMX' }
  end
end
