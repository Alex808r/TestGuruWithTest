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

require 'rails_helper'

RSpec.describe Badge, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :image_url }
    it { should validate_presence_of :rule }
    it { should validate_presence_of :parameter }
  end

  describe 'associations' do
    it { should have_many(:user_badges).dependent(:destroy) }
    it { should have_many(:users).through(:user_badges) }
  end

  describe 'database' do
    it { should have_db_column(:id).of_type(:integer) }
    it { should have_db_column(:id).with_options(primary: true) }
    it { should have_db_column(:id).with_options(null: false) }

    it { should have_db_column(:image_url).of_type(:string) }
    it { should have_db_column(:image_url).with_options(null: false) }

    it { should have_db_column(:parameter).of_type(:string) }
    it { should have_db_column(:parameter).with_options(null: false) }

    it { should have_db_column(:rule).of_type(:string).with_options(null: false) }
    it { should have_db_column(:title).of_type(:string).with_options(null: false) }
  end
end
