require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }
  
  describe 'associations' do
    it { is_expected.to have_many(:events) }
    it { is_expected.to have_many(:locations) }
    it { is_expected.to have_many(:sent_invitations).class_name('Invitation').with_foreign_key('sender_id') }
    it { is_expected.to have_many(:received_invitations).class_name('Invitation').with_foreign_key('receiver_id') }
  end
end
