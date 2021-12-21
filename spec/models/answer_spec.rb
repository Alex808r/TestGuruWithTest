# frozen_string_literal: true

# == Schema Information
#
# Table name: answers
#
#  id          :bigint           not null, primary key
#  body        :string           not null
#  correct     :boolean          default(TRUE), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :integer          not null
#
# Indexes
#
#  index_answers_on_question_id  (question_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#
require 'rails_helper'

RSpec.describe Answer, type: :model do
  
  describe 'associations' do
    # it { should belong_to(:question) }
  end

  describe 'validations' do
    # it { should validate_presence_of(:body)  }
  end

  describe 'database' do
    it { should have_db_column(:id).of_type(:integer).with_options(primary: true)}
    it { should have_db_column(:id).with_options(null: false) }

    it { should have_db_column(:body).of_type(:string).with_options(null: false) }

    it { should have_db_column(:correct).of_type(:boolean).with_options(default: true).with_options(null: false )}

    it { should have_db_index(:question_id) }
    it { should have_db_column(:question_id).of_type(:integer).with_options(null: false) }
  end
end
