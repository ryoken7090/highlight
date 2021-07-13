# frozen_string_literal: true

FactoryBot.define do
  factory :diary do
    sequence(:high_light) { |i| "Text#{i}" }
    concentration { (1..10).to_a.sample }
    energy { (1..10).to_a.sample }
    sequence(:reflection) { |i| "Reflection#{i}" }
    sequence(:thanks) { |i| "Thanks#{i}" }
    date { '20210101' }
  end
end
