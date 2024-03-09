require 'rails_helper'

RSpec.describe Location, type: :model do
 subject { build(:location) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:country) }
    it { is_expected.to validate_presence_of(:state) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:address_line_1) }
    it { is_expected.to validate_presence_of(:state) }
    it { is_expected.to allow_value("12345").for(:zipcode) }
    it { is_expected.to allow_value("12345-1234").for(:zipcode) }
    it { is_expected.to_not allow_value("123456").for(:zipcode) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:creator).class_name('User').with_foreign_key('user_id') }
  end

  describe 'instance_methods' do
    it '#full_address' do
      expect(subject.full_address).to include(subject.country)
      expect(subject.full_address).to include(subject.state)
      expect(subject.full_address).to include(subject.city)
      expect(subject.full_address).to include(subject.zipcode)
      expect(subject.full_address).to include(subject.address_line_1)
    end  
  end
end
