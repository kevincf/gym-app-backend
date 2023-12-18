class CreateExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :description
      t.string :example_url
      t.references :section, null: false, foreign_key: true

      t.timestamps
    end
  end
end
