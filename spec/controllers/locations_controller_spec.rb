require "rails_helper"

RSpec.describe LocationsController, type: :controller do
  subject { create(:location) }
    
  let(:user) { subject.creator }
  let(:location) { create(:location, creator: subject.creator ) }
  before { sign_in user }
  
  describe 'callbacks' do
    it { expect(controller).to use_before_action(:authenticate_user!) }
    it { expect(controller).to use_before_action(:set_location) }
  end


  describe "Post create" do
    it "success" do
      post :create, params: { user_id: user.id, location: build(:location, creator: user).attributes }
      
      expect(assigns(:location)).to be_present
      expect(response).to redirect_to(assigns[:location])
      expect(flash[:notice]).to eq('Location was successfully created.')
    end

    it 'failuar' do
      post :create, params: { user_id: user.id, location: build(:location, zipcode: nil).attributes }
     
      expect(response).to render_template(:new)
      expect(assigns(:location).errors).to be_present
      
    end  
  end

  describe "Put update" do
    it "success" do
      put :update, params: { user_id: user.id, id: subject.id, location: { name: 'change-name'  } }
     
      expect(assigns(:location)).to be_present
      expect(response).to redirect_to(assigns(:location))
      expect(flash[:notice]).to eq('Location was successfully updated.')
    end

    it "failuar" do
      put :update, params: { user_id: user.id, id: subject.id, location: { name: nil  } }
     
      expect(response).to render_template(:edit)
      expect(assigns(:location).errors).to be_present
    end
  end 

  describe "GET index" do
    it "success" do
      get :index, params: { user_id: user.id }
    
      expect(response.status).to eq(200)
      expect(response).to render_template(:index)
      expect(assigns(:locations)).to be_present
    end
  end

  describe "GET show" do
    it "success" do
      get :show, params: { user_id: user.id, id: subject.id }
   
      expect(response.status).to eq(200)
      expect(response).to render_template(:show)
      expect(assigns(:location)).to be_present
    end
  end

  describe "GET new" do
    it "success" do
      get :new, params: { user_id: user.id }
     
      expect(response.status).to eq(200)
      expect(response).to render_template(:new)
      expect(assigns(:location)).to be_a_new(Location)
    end
  end

  describe "GET edit" do
    it "success" do
      get :edit, params: { user_id: user.id, id: subject.id }
     
      expect(response.status).to eq(200)
      expect(response).to render_template(:edit)
      expect(assigns(:location)).to be_present
    end
  end
end