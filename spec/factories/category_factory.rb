# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :category do
    title { 'Backend' }
  end

  trait :frontend do
    title { 'Frontend' }
  end
end
