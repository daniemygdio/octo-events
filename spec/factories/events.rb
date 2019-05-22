FactoryBot.define do
  factory :event do
    github_action { %w[opened closed].sample }
  end
end
