class Appointment < ApplicationRecord
    
    belongs_to :client
    belongs_to :treatment
    has_many :reviews

    validates :treatment, :desired_time, :desired_date, presence: true

    scope :alpha, -> { order(:desired_date) }
    # scope :most_booked_treatments, -> {left_joins(:treatments).group('appointments.id').order('count(treatments.appointment_id) desc')}
    
    #accepts_nested_attributes_for 
end
