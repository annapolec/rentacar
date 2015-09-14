require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe "#home" do
    context 'when user is logged in' do
      before do
        login_with create(:user)
        car = create(:car)        
        get :home
      end  
      it { is_expected.to respond_with :ok }
      it { is_expected.to respond_with_content_type :html }
      it { is_expected.to render_with_layout :application }
      it { is_expected.to render_template(:home) }      
    end
    context 'when user is not logged in' do
      before do
        login_with nil
        get :home
      end  
      it { is_expected.to redirect_to new_user_session_path }
    end
  end
end
