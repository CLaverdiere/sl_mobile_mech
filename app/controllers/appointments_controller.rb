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
        UserMailer.welcome_email(@appointment).deliver
        AdminMailer.app_notification_email(@appointment).deliver
        flash[:notice] = "Appointment created!"
        format.html { redirect_to root_path, notice: 'Appointment successfully created. An email has been sent with confirmation info. Thanks!' }
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
      params.require(:appointment).permit(:name, :phone, :email, :time, :reason)
    end
end
