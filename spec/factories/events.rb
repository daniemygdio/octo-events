FactoryBot.define do
  factory :event do
    github_action { FFaker::Lorem.word }
    
  end
end
