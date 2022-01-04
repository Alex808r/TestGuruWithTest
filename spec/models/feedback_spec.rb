# frozen_string_literal: true

# == Schema Information
#
# Table name: feedbacks
#
#  id         :bigint           not null, primary key
#  content    :string           not null
#  email      :string           not null
#  header     :string           not null
#  user_name  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Feedback, type: :model do
  let(:feedback) { create(:feedback) }
  
  it 'factory should be valid' do
    expect(feedback).to be_valid
  end
  
  describe 'validations' do
    it { should validate_presence_of :user_name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :header }
    it { should validate_presence_of :content }
  end

  describe 'database' do
    it { should have_db_column(:id).of_type(:integer).with_options(primary: true) }
    it { should have_db_column(:id).with_options(null: false) }

    it { should have_db_column(:content).of_type(:string).with_options(null: false) }
    it { should have_db_column(:email).of_type(:string).with_options(null: false) }
    it { should have_db_column(:header).of_type(:string).with_options(null: false) }
    it { should have_db_column(:user_name).of_type(:string).with_options(null: false) }
  end
end
