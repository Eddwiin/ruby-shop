class User < ApplicationRecord
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    VALID_PHONE_REGEX = /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/
    
    # Should contain at least a capital letter
    # Should contain at least a small letter
    # Should contain at least a number
    # Should contain at least a special character
    # And minimum length
    VALID_PASSWORD_REGEX  = /\A^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*]).{8,}$\z/

    validates :last_name, presence: true, length: {minimum:3, maximum:15}
    validates :first_name, presence: true, length: {minimum:3, maximum:15} 
    validates :email, uniqueness: { case_sensitve: true}, format: { with: VALID_EMAIL_REGEX }
    validates :phone, uniqueness: true, format: { with: VALID_PHONE_REGEX}
    validates :adress, presence: true, uniqueness: true
    has_secure_password
    validates :password, format: { with: VALID_PASSWORD_REGEX}
end
