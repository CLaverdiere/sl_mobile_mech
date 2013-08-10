class AppointmentsController < ApplicationController
  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  def confirm
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to root_path, notice: 'Appointment was successfully created.' }
        format.json { render action: 'confirm', status: :created, location: root_path}
      else
        format.html { render action: 'new' }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:name, :phone, :email, :time)
    end
end
