class Appointment < ApplicationRecord
    
    belongs_to :client
    belongs_to :treatment

    # scope :alpha, -> { order(:appointments) }
    # scope :most_booked_treatments, -> {left_joins(:treatments).group('appointments.id').order('count(treatments.appointment_id) desc')}
    
    
end
