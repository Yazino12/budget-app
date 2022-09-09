class Entity < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :group_entities, dependent: :destroy
  has_many :groups, through: :group_entities

  validates :name, presence: true, length: { in: 1..20 }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 1 }
end
