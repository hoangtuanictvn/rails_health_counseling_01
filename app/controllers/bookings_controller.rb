class BookingsController < ApplicationController
  def create
    doctor = Doctor.find_by id: params[:booking][:doctor_id]
    @booking = doctor.schedules.build booking_params
    return if @booking.save
  end

  private

  def booking_params
    params.require(:booking).permit :doctor_id, :user_id, :title,
      :start_time, :stop_time, :category_id, :location,
      :state, :accept, :schedule_type
  end

end
