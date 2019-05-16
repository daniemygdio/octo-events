FactoryBot.define do  
  factory :issue do
    url { FFaker::Internet.http_url }
    number { FFaker::Random.rand(100..999) }
  end
end
