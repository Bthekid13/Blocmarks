# == Schema Information
#
# Table name: topics
#
#  id         :integer          not null, primary key
#  title      :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_topics_on_user_id  (user_id)
#

FactoryGirl.define do
  factory :topic do
    title "MyString"
    user User.last 
  end
end
