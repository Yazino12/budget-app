class User < ApplicationRecord
  has_many :entities
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { in: 1..15 }

  def admin?(requested_role)
    role == requested_role.to_s
  end
end
