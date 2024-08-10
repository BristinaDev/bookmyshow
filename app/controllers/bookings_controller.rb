class BookingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookings = current_user.bookings
  end
  
  def new
    @booking = Booking.new
    @show = Show.find(params[:show_id])
    @movie = @show.movie
    @available_seats = @show.seats.where(booked: false)
  end
  
  def create
    @booking = Booking.new(booking_params.merge(user_id: current_user.id))
    @show = Show.find(params[:show_id])

    if @booking.save!
      Seat.where(id: @booking.seat_ids).update_all(booked: true)
      redirect_to show_booking_path(@show, @booking)
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
    render :show
  end

  def destroy
    @booking = Booking.find(params[:id])
    @seats = Seat.where(id: @booking.seat_ids)
    @seats.update_all(booked: false)
    @booking.destroy
    redirect_to user_bookings_path
  end

  def user_bookings
    @bookings = current_user.bookings
  end

  private
  def booking_params
    params.require(:booking).permit(:number_of_seats, :show_id, seat_ids: [])
  end
end
