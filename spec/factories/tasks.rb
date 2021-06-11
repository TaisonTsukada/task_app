FactoryBot.define do
  factory :task do
    title { "タスク１" }
    content { "タスク１です"}
    deadline {"2021-06-09 01:50:11.862900"}
    status {:backlog}
    association :user
  end
end