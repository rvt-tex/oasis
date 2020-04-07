class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.string :special_request
      t.datetime :desired_time
      t.datetime :desired_date
      t.integer :client_id
      t.integer :treatment_id
      t.text :review

      t.timestamps
    end
  end
end
