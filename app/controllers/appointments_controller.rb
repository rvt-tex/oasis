class AppointmentsController < ApplicationController

    def new 
        @appointment = Appointment.new 
       
    end 

    def create 
        binding.pry 
        @appointment = current_client.appointments.build(appointment_params)
       
        if @appointment.save 
            redirect_to @appointment
        else 
            render :new 
        end 
    end 


    def show 
    end 

    private 

    def appointment_params
        params.require('appointment').permit(:special_request, :desired_time, :desired_date, :client, :treatment_id)
    end
end
