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
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:admin) { create(:user, :admin) }

  it 'admin?' do
    expect(user.type).to eq('User')
    expect(admin.type).to eq('Admin')
  end

  it 'factory should be valid' do
    # expect(user.valid?).to eq(true) аналогичная запись
    expect(user).to be_valid
  end

  describe 'associations' do
    it { should have_many(:test_passages).dependent(:destroy) }
    it { should have_many(:tests).through(:test_passages) }
    it { should have_many(:author_tests).class_name('Test').dependent(:destroy) }
    it { should have_many(:gists).dependent(:destroy) }
    it { should have_many(:user_badges).dependent(:destroy) }
    it { should have_many(:badges).through(:user_badges) }
  end

  describe 'validations' do
    it { should validate_presence_of :email }
  end

  describe 'database' do
    it { should have_db_column(:id).of_type(:integer) }
    it { should have_db_column(:id).with_options(primary: true) }
    it { should have_db_column(:id).with_options(null: false) }

    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:email).with_options(null: false) }
    it { should have_db_column(:email).with_options(default: '') }

    it { should have_db_column(:first_name).of_type(:string) }
    it { should have_db_column(:last_name).of_type(:string) }

    it { should have_db_column(:name).of_type(:string).with_options(null: false) }

    it { should have_db_column(:type).of_type(:string).with_options(null: false) }
    it { should have_db_column(:type).with_options(default: 'User') }

    it { should have_db_index(:type) }
    it { should have_db_index(:email).unique(true) }
    it { should have_db_index(:reset_password_token).unique(true) }
    it { should have_db_index(:confirmation_token).unique(true) }
  end
end
