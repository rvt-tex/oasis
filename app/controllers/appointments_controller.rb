class AppointmentsController < ApplicationController

    def new 
        @appointment = Appointment.new  
    end 

    def create 
        #binding.pry
        @appointment = current_client.appointments.build(appointment_params)
        binding.pry
        if @appointment.save 
            redirect_to @appointment
        else 
            render :new 
        end 
    end 

    private 

    def appointment_params
        params.require('appointment').permit(:specail_request, :desired_time, :desired_date, :client, treatment_ids:[])
    end
end
