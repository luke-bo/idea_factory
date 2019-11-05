require 'rails_helper'

RSpec.describe IdeasController, type: :controller do
  context "without user signed in"
    it "renders the sign in page" do
      get :new
      expect(response).to redirect_to(new_session_path)
    end

  
  context 'With user signed in' do
    
    before do
      let!(:user) { User.create({ email: 'john@smith.com', password: 'supersecret' }) }
      request.session[:user_id] = :user.id
    end
    
    it "renders the new idea form" do
      get :new
      expect(response).to redirect_to(new_idea_path)
    end
  end
end
