# frozen_string_literal: true
FactoryGirl.define do
  notes_separator = %w(, . ;)
  factory :business_process do
    sequence(:uid, 1) { |n| "process#{n}" }
    name Faker::Lorem.sentence
    identifier { FactoryGirl.attributes_for(:identifiers) }
    notes_separator (notes_separator.sample)
  end

  factory :identifiers do
    loan { FactoryGirl.attributes_for(:identifierstatus) }
  end

  factory :identifierstatus do
    status '0'
  end
end

