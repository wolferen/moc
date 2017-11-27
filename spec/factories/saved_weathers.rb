# frozen_string_literal: true

FactoryBot.define do
  factory :saved_weather do
    location Faker::Name.title
    yahoo_title Faker::Name.title
    yahoo_temp  Faker::Number.digit
    yahoo_text  Faker::Job.title
    owm_min  Faker::Number.digit
    owm_max  Faker::Number.digit
    owm_cloud Faker::Name.first_name
  end
end
