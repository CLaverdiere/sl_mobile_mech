class Admin::AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: ENV['username'], 
                           password: ENV['password'], only: [:index]

  # GET /admin/appointments
  # GET /admin/appointments.json
  def index
    case params[:show]
    when 'all'
      @appointments = Appointment.order("time DESC")
    when 'current'
      @appointments = Appointment.where("time > ?", Date.today).order("time ASC")
    when 'past'
      @appointments = Appointment.where("time < ?", Date.today).order("time DESC")
    else
      @appointments = Appointment.order("time DESC")
      # @appointments = Appointment.where("name LIKE ?", "%#{params[:search]}%").order("time DESC")
    end
  end

  # GET /admin/appointments/1
  # GET /admin/appointments/1.json
  def show
  end

  # GET /admin/appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /admin/appointments/1/edit
  def edit
  end

  # POST /admin/appointments
  # POST /admin/appointments.json
  def create
    @appointment = Appointment.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to admin_appointment_path(@appointment), notice: 'Appointment was successfully created.' }
        format.json { render action: 'show', status: :created, location: admin_appointment_path }
      else
        format.html { render action: 'new' }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/appointments/1
  # PATCH/PUT /admin/appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to admin_appointment_path, notice: 'Appointment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/appointments/1
  # DELETE /admin/appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to admin_appointments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:name, :phone, :email, :time, :reason)
    end
end
