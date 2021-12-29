# == Schema Information
#
# Table name: badges
#
#  id         :bigint           not null, primary key
#  image_url  :string           not null
#  parameter  :string           not null
#  rule       :string           not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :badge do
    image_url { 'Image' }
    parameter { 'Image' }
    rule { 'rule' }
    title { 'title' }
  end
end