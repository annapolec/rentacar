require 'rails_helper'
RSpec.describe CarsController, :type => :controller do
  describe 'GET #index' do
    context 'when user is not logged in' do
      before do
        login_with nil
        get :index
      end
      it { is_expected.to redirect_to new_user_session_path }
    end
    context 'when user is logged in' do
      before do
        login_with create( :user )
        get :index
      end
      it { is_expected.to respond_with :ok }
      it { is_expected.to respond_with_content_type :html }
      it { is_expected.to render_with_layout :application }
      it { is_expected.to render_template :index }
    end
  end

  describe 'GET #new' do
    context 'when user is not logged in' do
      before do
        login_with nil
        get :new
      end
      it { is_expected.to redirect_to new_user_session_path }
    end
    context 'when user is logged in' do
      before do
        login_with create( :user )
        get :new
      end
      it { is_expected.to respond_with :ok }
      it { is_expected.to respond_with_content_type :html }
      it { is_expected.to render_with_layout :application }
      it { is_expected.to render_template :new }
    end
  end

  describe 'GET #show' do
    context 'when user is not logged in' do
      before do
        car = create(:car)
        login_with nil
        get :show, id: car.id
      end
      it { is_expected.to redirect_to new_user_session_path }
    end
    context 'when user is logged in' do
      before do
        car = create(:car)
        login_with create( :user )
        get :show, id: car.id
      end
      it { is_expected.to respond_with :ok }
      it { is_expected.to respond_with_content_type :html }
      it { is_expected.to render_with_layout :application }
      it { is_expected.to render_template :show }
    end
  end

  describe 'GET #edit' do
    context 'when user is not logged in' do
      before do
        car = create(:car)
        login_with nil
        get :edit, id: car.id
      end
      it { is_expected.to redirect_to new_user_session_path }
    end
    context 'when user is logged in' do
      before do
        car = create(:car)
        login_with create( :user )
        get :edit, id: car.id
      end
      it { is_expected.to respond_with :ok }
      it { is_expected.to respond_with_content_type :html }
      it { is_expected.to render_with_layout :application }
      it { is_expected.to render_template :edit }
    end
  end
end