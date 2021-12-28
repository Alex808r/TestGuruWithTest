# frozen_string_literal: true

# == Schema Information
#
# Table name: user_badges
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  badge_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_user_badges_on_badge_id  (badge_id)
#  index_user_badges_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (badge_id => badges.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe UserBadge, type: :model do
  
  describe 'associations' do
    it { should belong_to(:badge) }
    it { should belong_to(:user) }
  end

  describe 'database' do
    it { should have_db_column(:id).of_type(:integer)}
    it { should have_db_column(:id).with_options(primary: true) }
    it { should have_db_column(:id).with_options(null: false) }
  
    it { should have_db_index(:badge_id) }
    it { should have_db_column(:badge_id).of_type(:integer) }
    it { should have_db_column(:badge_id).with_options(null: false) }
  
    it { should have_db_index(:user_id) }
    it { should have_db_column(:user_id).of_type(:integer) }
    it { should have_db_column(:user_id).with_options(null: false) }
  end
end
