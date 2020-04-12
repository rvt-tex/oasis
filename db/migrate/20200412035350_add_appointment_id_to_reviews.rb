class AddAppointmentIdToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :appointment_id, :integer
  end
end
