class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [ :show, :edit, :update, :destroy ]

  def index
    @appointments = Appointment.order(:appointment_date)
  end

  def show
  end

  def new
    @appointment = Appointment.new
    @patients = Patient.all
    @doctors = Doctor.all
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to @appointment, notice: "Appointment was successfully created."
    else
      @patients = Patient.all
      @doctors = Doctor.all
      render :new
    end
  end

  def edit
    @patients = Patient.all
    @doctors = Doctor.all
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to @appointment, notice: "Appointment was successfully updated."
    else
      @patients = Patient.all
      @doctors = Doctor.all
      render :edit
    end
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_path, notice: "Appointment was successfully destroyed."
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:patient_id, :doctor_id, :appointment_date, :diagnosis, :notes)
  end
end
