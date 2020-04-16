class Appointment < ApplicationRecord
    
    belongs_to :client
    belongs_to :treatment
    has_many :reviews
    has_many :clients, through: :reviews
    
    validates :treatment, :desired_time, :desired_date, presence: true


    validate :desired_date_cannot_be_in_the_past
 
    def desired_date_cannot_be_in_the_past
        if desired_date.present? && desired_date < Date.today
            errors.add(:desired_date, "can't be in the past")
        end
    end 




    scope :alpha, -> { order(:desired_date) }
    # scope :most_booked_treatments, -> {left_joins(:treatments).group('appointments.id').order('count(treatments.appointment_id) desc')}
    
    #accepts_nested_attributes_for 
end
