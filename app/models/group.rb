class Group < ApplicationRecord
  belongs_to :user
  has_many :group_entities, dependent: :destroy
  has_many :entities, through: :group_entities

  validates :name, presence: true, length: { in: 1..20 }
  validates :icon, presence: true, length: { in: 1..300 }
end
