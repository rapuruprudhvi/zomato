class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
    
      BookingRemainderJob.set(wait_until: @booking.date - 15.minutes).perform_later(@booking.id)
      redirect_to @booking, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end
  private
  def booking_params
    params.require(:booking).permit(:name, :date, :description)
  end

end
