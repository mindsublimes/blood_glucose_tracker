class CreateGlucoseReadings < ActiveRecord::Migration[6.1]
  def change
    create_table :glucose_readings do |t|
      t.integer :blood_reading
      t.datetime :reading_time
      t.integer :measure_unit, default: 0

      t.timestamps
    end
  end
end
