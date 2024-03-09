require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:start_at) }
    it { is_expected.to validate_presence_of(:end_at) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:invitations) }
    it { is_expected.to belong_to(:location) }
    it { is_expected.to belong_to(:creator).class_name('User').with_foreign_key('user_id') }
  end

  describe 'accepts_nested_attributes' do
    it { is_expected.to accept_nested_attributes_for(:invitations) }
          
  end  
end
