json.extract! workout, :id, :name, :date, :level, :program_id, :created_at, :updated_at
json.url workout_url(workout, format: :json)
