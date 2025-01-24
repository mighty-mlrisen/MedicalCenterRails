class Patient < ApplicationRecord
  has_many :appointments, dependent: :destroy
  validates :fullname, presence: true
  validates :age, presence: true
  validates :phone, presence: true
end
