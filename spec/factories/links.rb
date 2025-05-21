FactoryBot.define do
  factory :link do
    original_url { "MyText" }
    slug { "MyString" }
    click_count { 1 }
    user { nil }
    expires_at { "2025-05-21 15:12:52" }
    status { 1 }
  end
end
