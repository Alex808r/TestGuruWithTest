# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { create(:category) }

  it 'factory should be valid' do
    expect(category).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
  end

  describe 'associations' do
    it { should have_many(:tests).dependent(:destroy) }
  end

  describe 'database' do
    it { should have_db_column(:id).of_type(:integer) }
    it { should have_db_column(:id).with_options(primary: true) }
    it { should have_db_column(:id).with_options(null: false) }

    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:title).with_options(null: false) }
  end
end
