class User < ApplicationRecord
  has_secure_password
  has_many :products
  validates :email, uniqueness: true

  # make sure that you can ONLY create a user with the role 'user' or 'admin'
  validates :role, inclusion: { in: %w[user admin], message: "%{value} is not a valid role"}

  def admin?
    # returns true if user.role == admin
    # returns false otherwise
    return role == "admin"
  end

  def user?
    # return true if user.role == user
    # returns false otherwise
    role == "user"
  end
end