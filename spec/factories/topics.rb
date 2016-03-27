FactoryGirl.define do
  factory :topic do
    title "MyString"
    user User.last 
  end
end
