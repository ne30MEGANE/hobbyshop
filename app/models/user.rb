class User < ApplicationRecord
    has_secure_password

    has_many :reviews
    has_many :orders

    validates :user_name, presence: true, length: {minimum: 2, maximum: 15, allow_blank: true}
    validates :nickname, presence: true, length: {minimum: 2, maximum: 15, allow_blank: true}
    validates :phone, presence: true, format: {
      with: /\A[0-9\(\)\-]*\z/,
      allow_blank: true,
      message: :invalid_telephone_number
    }, uniqueness: true
    validates :email, presence: true, email: {allow_blank: true}, uniqueness: true
    validates :postcode, presence: true, format: {
      with: /\A[0-9]{3}-[0-9]{4}\z/,
      allow_blank: true,
      message: :invalid_postcode
    }
    validates :address, presence: true
    

    attr_accessor :current_password
    validates :password, length:{ minimum: 6, if: :current_password }, presence: {if: :current_password }
end