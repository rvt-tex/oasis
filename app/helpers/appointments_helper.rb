module AppointmentsHelper

    def index_display_header
        if @client
            content_tag(:h2, "#{@client.first_name}'s Appointments:")
        else
            content_tag(:h3, "All Appointments")
        end
    end
    
    # def display_appointments 
    #     if @client.appointments.empty?
    #         tag.h2(link_to('No appointments yet - Book an Appointment here', new_appointment_path))
    #     else
    #         client = @client == current_user ? 'Your' : "#{@client.first_name}'s"
    #         content_tag(:h2, "#{client} #{pluralize(@client.appointments.count, 'Appointment')}:")
    #     end
    # end
end
