class DoctorsController < ApplicationController
  before_action :set_doctor, only: [ :show, :edit, :update, :destroy ]

  def index
    @doctors = Doctor.order(:fullname)
  end

  def show
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to @doctor, notice: "Doctor was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @doctor.update(doctor_params)
      redirect_to @doctor, notice: "Doctor was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    if @doctor.destroy
      redirect_to doctors_path, status: :see_other, notice: "Doctor was successfully destroyed."
    else
      redirect_to doctors_path, alert: "It is impossible to delete a doctor because there are related objects."
    end
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:fullname, :specialization, :experience)
  end
end
