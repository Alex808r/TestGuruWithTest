# frozen_string_literal: true

# == Schema Information
#
# Table name: gists
#
#  id          :bigint           not null, primary key
#  gist_hash   :string
#  gist_url    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :integer          not null
#  user_id     :integer          not null
#
# Indexes
#
#  index_gists_on_question_id  (question_id)
#  index_gists_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#  fk_rails_...  (user_id => users.id)
#

require 'rails_helper'

RSpec.describe Gist, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:question) }
  end

  describe 'database' do
    it { should have_db_column(:id).of_type(:integer) }
    it { should have_db_column(:id).with_options(primary: true) }

    it { should have_db_column(:gist_hash).of_type(:string) }
    it { should have_db_column(:gist_url).of_type(:string) }

    it { should have_db_index(:user_id) }
    it { should have_db_column(:user_id).of_type(:integer).with_options(null: false) }

    it { should have_db_index(:question_id) }
    it { should have_db_column(:question_id).of_type(:integer).with_options(null: false) }
  end
end
