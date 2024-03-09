require "rails_helper"

RSpec.describe EventsController, type: :controller do
  subject { create(:event) }
    
  let(:user) { subject.creator }

  let(:location) { create(:location, creator: subject.creator ) }
  before { sign_in user }
  
  describe 'callbacks' do
    it { expect(controller).to use_before_action(:authenticate_user!) }
    it { expect(controller).to use_before_action(:set_event) }
  end


  describe "Post create" do
    it "success" do
      post :create, params: { user_id: user.id, event: build(:event, location: location).attributes }
     
      expect(assigns(:event)).to be_present
      expect(response).to redirect_to(assigns(:event))
      expect(flash[:notice]).to eq('Event was successfully created.')
    end

    it 'failuar' do
      post :create, params: { user_id: user.id, event: build(:event, location: location, start_at: nil).attributes }
     
      expect(response).to render_template(:new)
      expect(assigns(:event).errors).to be_present
      
    end  
  end

  describe "Put update" do
    it "success" do
      put :update, params: { user_id: user.id, id: subject.id, event: { name: 'change-name'  } }
     
      expect(assigns(:event)).to be_present
      expect(response).to redirect_to(assigns(:event))
      expect(flash[:notice]).to eq('Event was successfully updated.')
    end

    it "failuar" do
      put :update, params: { user_id: user.id, id: subject.id, event: { name: nil  } }
     
      expect(response).to render_template(:edit)
      expect(assigns(:event).errors).to be_present
    end
  end 

  describe "GET index" do
    it "success" do
      get :index, params: { user_id: user.id }
    
      expect(response.status).to eq(200)
      expect(response).to render_template(:index)
      expect(assigns(:events)).to be_present
    end
  end

  describe "GET show" do
    it "success" do
      get :show, params: { user_id: user.id, id: subject.id }
   
      expect(response.status).to eq(200)
      expect(response).to render_template(:show)
      expect(assigns(:event)).to be_present
    end
  end

  describe "GET new" do
    it "success" do
      get :new, params: { user_id: user.id }
     
      expect(response.status).to eq(200)
      expect(response).to render_template(:new)
      expect(assigns(:event)).to be_a_new(Event)
    end
  end

  describe "Post show" do
    it "success" do
      get :edit, params: { user_id: user.id, id: subject.id }
     
      expect(response.status).to eq(200)
      expect(response).to render_template(:edit)
      expect(assigns(:event)).to be_present
    end
  end
end