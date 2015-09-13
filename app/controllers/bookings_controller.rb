class BookingsController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :authenticate_user!
  before_action :find_car

  def index
    @bookings = Booking.where("car_id = ? AND end_time >= ?", @car.id, Time.now).order(:start_time)
    respond_with @bookings
  end

  def create
    @booking =  @car.bookings.create(booking_params)
    @booking.assign_cost
    if @booking.save
      redirect_to car_booking_path(@car, @booking)
    else
      render 'cars/show'
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def destroy
    @booking = Booking.find(params[:id]).destroy
    if @booking.destroy
      flash[:success] = "Booking #{@booking.car.name} by #{@booking.client} has been canceled"
      redirect_to car_path(@car)
    else
      render 'index'
    end
  end

  def update
    @booking = Booking.find(params[:id])
    # @booking.car = @car

    if @booking.update(params[:booking].permit(:car_id, :start_time, :length))
      flash[:notice] = 'Your booking was updated succesfully'

      if request.xhr?
        render json: {status: :success}.to_json
      else
        redirect_to car_bookings_path(@car)
      end
    else
      render 'edit'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :length, :client, :car_id)
  end

  def save booking
    if @booking.save
        flash[:notice] = 'booking added'
        redirect_to car_booking_path(@car, @booking)
      else
        render 'new'
      end
  end

  def find_car
    if params[:car_id]
      @car = Car.find_by_id(params[:car_id])
    end
  end

end
