class Doctor < ApplicationRecord
  validates :fullname, presence: true
  validates :specialization, presence: true
  validates :experience, presence: true
end
