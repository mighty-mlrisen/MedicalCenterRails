class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  validates :appointment_date, presence: true
  validates :diagnosis, presence: true
end
