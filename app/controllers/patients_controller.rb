class PatientsController < ApplicationController
  before_action :set_patient, only: [ :show, :edit, :update, :destroy ]

  def index
    @patients = Patient.order(:fullname)
  end

  def show
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to @patient, notice: "Patient was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @patient.update(patient_params)
      redirect_to @patient, notice: "Patient was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    if @patient.destroy
      redirect_to patients_path, status: :see_other, notice: "Patient was successfully destroyed."
    else
      redirect_to patients_path, alert: "It is impossible to delete a patient because there are related objects."
    end
  end

  private

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:fullname, :age, :phone)
  end
end
