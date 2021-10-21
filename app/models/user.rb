class User < ApplicationRecord
  has_one :order
  
  validates :name, presence: true
  validates :cpf, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
