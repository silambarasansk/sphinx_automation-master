FactoryGirl.define do
  separator = %w(, . ;  )
  factory :note do
    separator (separator.sample)
    entries {{"text"=>[{"type" "Text" => "value" "Test 2"}]}}
  end
end