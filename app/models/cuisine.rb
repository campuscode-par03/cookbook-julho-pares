class Cuisine < ApplicationRecord
  validates :name, presence: { message: "Preencher todos os campos" }
  validates :name, uniqueness: { message: "Ja existe cozinha com este nome" }
  has_many :recipes
end
