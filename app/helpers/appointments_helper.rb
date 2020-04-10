module AppointmentsHelper
    
    def display_appointments 
        if @client.appointments.empty?
            content_tag(:h5, link_to('No appointments yet - Book an Appointment here', new_appointment_path))
        else
            client = @client == current_client ? 'You have' : "#{@client.first_name}'s"
            content_tag(:h4, "#{client} #{pluralize(@client.appointments.count, 'booked Appointments')}:")
        end
    end
end
