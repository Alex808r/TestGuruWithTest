# frozen_string_literal: true

# == Schema Information
#
# Table name: test_passages
#
#  id                  :bigint           not null, primary key
#  correct_questions   :integer          default(0)
#  success             :boolean          default(FALSE)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  current_question_id :integer
#  test_id             :integer          not null
#  user_id             :integer          not null
#
# Indexes
#
#  index_test_passages_on_current_question_id  (current_question_id)
#  index_test_passages_on_test_id              (test_id)
#  index_test_passages_on_user_id              (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (current_question_id => questions.id)
#  fk_rails_...  (test_id => tests.id)
#  fk_rails_...  (user_id => users.id)
#

require 'rails_helper'

RSpec.describe TestPassage, type: :model do
  describe 'associations' do
    # it {is_expected.to have_many(:answers)} # аналогичная запись
    it { should belong_to(:user) }
    it { should belong_to(:test) }
    # it { should have_many(:current_question).class_name('Question') }
  end

  describe 'database' do
    it { should have_db_column(:id).of_type(:integer).with_options(primary: true) }
    it { should have_db_column(:id).with_options(null: false) }

    it { should have_db_column(:correct_questions).of_type(:integer).with_options(default: 0) }
    it { should have_db_column(:success).of_type(:boolean).with_options(default: false) }

    it { should have_db_index(:test_id) }
    it { should have_db_column(:test_id).of_type(:integer).with_options(null: false) }

    it { should have_db_index(:user_id) }
    it { should have_db_column(:user_id).of_type(:integer).with_options(null: false) }

    it { should have_db_index(:current_question_id) }
    it { should have_db_column(:current_question_id).of_type(:integer) }
  end
end
