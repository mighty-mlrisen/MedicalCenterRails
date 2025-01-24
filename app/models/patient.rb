class Patient < ApplicationRecord
  has_many :appointments, dependent: :restrict_with_error

  validates :fullname, presence: true, length: { minimum: 3, maximum: 100 }, format: {
    with: /\A([a-zA-Zа-яА-ЯёЁ]+(\s[a-zA-Zа-яА-ЯёЁ]+){1,2})\z/,
    message: "Full name must contain 2 or 3 words consisting only of letters, spaces and periods"
  }

  validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :phone, presence: true, format: {
     with: /\A(?:\+7|8)[\s-]?(?:\(?\d{3}\)?[\s-]?)\d{3}[\s-]?\d{2}[\s-]?\d{2}\z/,
     message: "Invalid phone format"
  }
end
