FactoryGirl.define do
  factory :online_test do
    title "one"
  end
  factory :online_test_with_questions, class: OnlineTest do
    title "one"
    transient do
      questions_count 5
    end
    after(:create) do |online_test, evaluator|
      create_list(:question, evaluator.questions_count, online_test: online_test)
    end
  end
end