require 'rails_helper'

RSpec.describe Invitation, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:receiver).class_name('User').with_foreign_key('receiver_id') }
    it { is_expected.to belong_to(:sender).class_name('User').with_foreign_key('sender_id') }
    it { is_expected.to belong_to(:event) }
  end

  describe 'callbacks' do
    it { is_expected.to callback(:generate_token).before(:create) } 
    it { is_expected.to callback(:send_invitation).after(:create) }
  end
end
