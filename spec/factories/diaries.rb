# frozen_string_literal: true

FactoryBot.define do
  factory :diary do
    high_light { 'MyText' }
    concentration { '10' }
    energy { '10' }
    reflection { 'MyReflection' }
    thanks { 'MyThanks' }
    date { '20210101' }
  end
end
