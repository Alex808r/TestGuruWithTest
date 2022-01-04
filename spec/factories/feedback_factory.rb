# == Schema Information
#
# Table name: feedbacks
#
#  id         :bigint           not null, primary key
#  content    :string           not null
#  email      :string           not null
#  header     :string           not null
#  user_name  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :feedback do
    content { 'Feedback content' }
    email { 'Feedback email' }
    header { 'Feedback header' }
    user_name { 'Feedback user name' }
  end
end
