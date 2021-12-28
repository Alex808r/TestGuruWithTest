# frozen_string_literal: true

# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  body       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  test_id    :integer          not null
#
# Indexes
#
#  index_questions_on_test_id  (test_id)
#
# Foreign Keys
#
#  fk_rails_...  (test_id => tests.id)
#
require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) { create(:question) }

  it 'factory should be valid' do
    expect(question).to be_valid
  end

  describe 'associations' do
    # it {is_expected.to have_many(:answers)} # аналогичная запись
    it { should belong_to(:test) }
    it { should have_many(:answers).dependent(:destroy) }
    it { should have_many(:gists).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of :body }
  end

  describe 'database' do
    it { should have_db_column(:id).of_type(:integer).with_options(primary: true) }
    it { should have_db_column(:id).with_options(null: false) }

    it { should have_db_column(:body).of_type(:string).with_options(null: false) }

    it { should have_db_index(:test_id) }
    it { should have_db_column(:test_id).of_type(:integer).with_options(null: false) }
  end
end
