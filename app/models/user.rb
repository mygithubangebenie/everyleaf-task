class User < ApplicationRecord
    validates :name, :email, :password, presence: true
    has_many :tasks
    has_secure_password
end
