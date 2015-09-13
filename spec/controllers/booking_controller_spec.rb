require 'rails_helper'
RSpec.describe BookingsController, :type => :controller do
  

describe 'GET #show' do
  context 'when user is not logged in' do
    before do
      car = create(:car)
      booking = create(:booking)
      login_with nil
      get :show, car_id: car.id, id: booking.id
    end  
    it { is_expected.to redirect_to new_user_session_path }
  end
  context 'when user is logged in' do
    before do
      car = create(:car)
      booking = create(:booking)
      login_with create(:user)
      get :show, car_id: car.id, id: booking.id
    end
    it { is_expected.to respond_with :ok }
    it { is_expected.to respond_with_content_type :html }
    it { is_expected.to render_with_layout :application }
    it { is_expected.to render_template :show }
  end
end

describe 'GET #index' do
  context 'when user is not logged in' do
    before do
      car = create(:car)
      login_with nil
      get :index, car_id: car.id
    end  
    it { is_expected.to redirect_to new_user_session_path }
  end
  context 'when user is logged in' do
    before do
      car = create(:car)
      booking = create(:booking)
      login_with create(:user)
      get :index, car_id: car.id
    end
    it { is_expected.to respond_with :ok }
    it { is_expected.to respond_with_content_type :html }
    it { is_expected.to render_with_layout :application }
    it { is_expected.to render_template :index }
  end
end

end