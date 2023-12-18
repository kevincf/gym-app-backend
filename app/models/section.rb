class Section < ApplicationRecord
  belongs_to :workout

  has_many :section_exercises
  has_many :exercises, through: :section_exercises
end
