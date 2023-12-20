class Program < ApplicationRecord
  belongs_to :tenant
  has_many :workouts, dependent: :destroy
end
