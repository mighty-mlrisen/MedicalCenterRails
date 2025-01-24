class Doctor < ApplicationRecord
  validates :fullname, presence: true, length: { minimum: 3, maximum: 100 }, format: {
    with: /\A([a-zA-Zа-яА-ЯёЁ]+(\s[a-zA-Zа-яА-ЯёЁ]+){1,2})\z/,
    message: "Full name must contain 2 or 3 words consisting only of letters, spaces and periods"
  }
  validates :specialization, presence: true
  validates :experience, presence: true, numericality: { only_integer: true }
end
