class BookingRemainderJob < ApplicationJob
  queue_as :default

  def perform(booking_id)
    puts "Sending remainder to customer"
    # booking = Booking.find(booking_id)
    # booking.user.email
    # BookingMailer.send(booking)
  end
end
