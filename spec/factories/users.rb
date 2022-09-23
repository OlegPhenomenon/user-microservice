FactoryBot.define do
  factory :user do
    name { "Oleg" }
    email { "oleg@test.com" }
    password { 'givemeatoken' }
  end
end
