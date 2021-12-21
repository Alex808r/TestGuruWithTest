# frozen_string_literal: true

# == Schema Information
#
# Table name: tests
#
#  id           :bigint           not null, primary key
#  level        :integer          default(0), not null
#  passing_time :integer
#  title        :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  author_id    :integer          not null
#  category_id  :integer          not null
#
# Indexes
#
#  index_tests_on_author_id        (author_id)
#  index_tests_on_category_id      (category_id)
#  index_tests_on_title_and_level  (title,level) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#  fk_rails_...  (category_id => categories.id)
#
require 'rails_helper'

RSpec.describe Test, type: :model do
  describe 'associations' do
    # it {is_expected.to have_many(:answers)} # аналогичная запись
    it { should belong_to(:category) }
    it { should belong_to(:author).class_name('User') }
    it { should have_many(:questions).dependent(:destroy) }
    it { should have_many(:test_passages).dependent(:destroy) }
    it { should have_many(:users).through(:test_passages) }
  end

  describe 'validations' do
   it { should validate_presence_of :title }
   it { should validate_presence_of :passing_time }
   it { should validate_numericality_of(:level) }
   # it { should validate_uniqueness_of(:title).ignoring_case_sensitivity.scoped_to(:level)
   #               .with_message("The name and level of the test are already in use") }
  end

  describe 'database' do
    it { should have_db_column(:id).of_type(:integer)}
    it { should have_db_column(:id).with_options(primary: true) }
    it { should have_db_column(:id).with_options(null: false) }

    it { should have_db_column(:level).of_type(:integer) }
    it { should have_db_column(:level).with_options(null: false) }
    it { should have_db_column(:level).with_options(default: 0) }

    it { should have_db_column(:passing_time).of_type(:integer) }

    it { should have_db_column(:title).of_type(:string).with_options(null: false) }

    it { should have_db_index(:author_id) }
    it { should have_db_column(:author_id).of_type(:integer) }
    it { should have_db_column(:author_id).with_options(null: false) }

    it { should have_db_index(:category_id) }
    it { should have_db_column(:category_id).of_type(:integer) }
    it { should have_db_column(:category_id).with_options(null: false) }
  end
end
