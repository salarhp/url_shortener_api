FactoryBot.define do
  factory :link do
    original_url { "https://test.com" }
    slug { "MyString" }
    click_count { 1 }
    association :user
    expires_at { "2025-05-21 15:12:52" }
  end
end
