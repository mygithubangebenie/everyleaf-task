class User < ApplicationRecord
    validates :name, :email, :password, presence: true
    has_many :tasks, dependent: :destroy
    has_secure_password
end
