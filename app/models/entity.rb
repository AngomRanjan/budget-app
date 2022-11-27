class Entity < ApplicationRecord
  belongs_to :user
  belongs_to :group, dependent: :destroy

  validates :name, presence: true
  validates :amount, presence: true
end
