class CalendarController < ApplicationController

  def calendar
    @bookings = Booking.all
  end

end
