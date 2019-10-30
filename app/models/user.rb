class User < ApplicationRecord
    validates :name, :email, :password, presence: true
    has_many :tasks, dependent: :destroy
    has_many :labels, dependent: :destroy
    has_secure_password
    validates :email, uniqueness: true
def email_uniqueness
 if AlternateAddress.find_by_email(self.email)
   self.errors.add(:email, "is already in use by another account")
 end
end
end
