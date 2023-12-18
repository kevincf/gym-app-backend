class CreateSectionExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :section_exercises do |t|
      t.references :section, null: false, foreign_key: true
      t.references :exercise, null: false, foreign_key: true
      t.integer :rounds
      t.integer :reps
      t.integer :weight

      t.timestamps
    end
  end
end
