class AddUserToGlucoseReading < ActiveRecord::Migration[6.1]
  def change
    add_reference :glucose_readings, :user
  end
end
