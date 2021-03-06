# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  name                   :string           not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  type                   :string           default("User"), not null
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_type                  (type)
#

FactoryBot.define do
  sequence :email do |n|
    "user#{n}@test.com"
  end

  sequence :name do |n|
    "user #{n}"
  end

  factory :user do
    before(:create) { |user| user.skip_confirmation! }
    email
    name
    password { '12345678' }
    password_confirmation { '12345678' }
  end

  trait :admin do
    type { 'Admin' }
  end
end
