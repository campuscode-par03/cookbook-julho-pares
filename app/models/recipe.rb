class Recipe < ApplicationRecord
  belongs_to :cuisine
  belongs_to :recipe_type
  belongs_to :user

  validates :title, :difficulty, :cook_time, :cook_method,
            :ingredients, presence: true

  def cook_time_min
    "#{cook_time} minutos"
  end

  def self.search_by_title(title)
    where(title: title)
  end
end
