class Exercise < ApplicationRecord
  belongs_to :section

  has_many :section_exercises
  has_many :sections, through: :section_exercises
end
