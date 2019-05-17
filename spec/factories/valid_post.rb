FactoryBot.define do  
  factory :valid_post do
    github_action { %w[opened closed] }
    issue {
      url { FFaker::Internet.http_url }
      number { FFaker::Random.rand(100..999) }
    }
  end
end
