require "rails_helper"

RSpec.describe InvitationsController, type: :controller do
  let(:user) { create(:user) }
  let(:event) { create(:event, creator: user) }
  let(:invitation_attributes) { build(:invitation, event: event, sender: user).attributes }
  subject {create(:invitation, event: event, receiver: user)}

  before { sign_in user }
  
  describe 'callbacks' do
    it { expect(controller).to use_before_action(:authenticate_user!) }
    it { expect(controller).to use_before_action(:set_invitation) }
    it { expect(controller).to use_before_action(:set_params) }
    it { expect(controller).to use_before_action(:set_event) }
  end

  describe "GET new" do
    it "success" do
      get :new, params: { event_id: event.id, invitation: invitation_attributes }

      expect(response).to render_template(:new)
      expect(assigns(:invitation)).to be_a_new(Invitation)
      expect(assigns(:event)).to be_present
    end
  end

  describe "GET new" do
    it "success" do
      get :new, params: { event_id: event.id, invitation: invitation_attributes }

      expect(response).to render_template(:new)
      expect(assigns(:invitation)).to be_a_new(Invitation)
      expect(assigns(:event)).to be_present
    end
  end

  describe "GET sent_invitations" do
    it "success" do
      get :sent_invitations

      expect(response).to render_template(:sent_invitations)
      expect(response.status).to eq(200)
    end
  end

  describe "GET receive_invitations" do
    it "success" do
      get :receive_invitations

      expect(response).to render_template(:receive_invitations)
      expect(response.status).to eq(200)
    end
  end

  describe "GET confirm" do
    it "success" do
      get :confirm, params: { token: subject.token }

      expect(flash[:notice]).to eq('Thanks for confirming!.')
      expect(assigns[:invitation].confirm).to be_truthy
    end
  end
end  