class AppointmentsController < ApplicationController

    def index
        if params[:client_id]
          client = Client.find_by(id:params[:client_id])
          if client
            @appointments = client.appointments
          else
            flash[:alert] = "Client not found."
            redirect_to clients_path
          end
        else
          @appointments = Appointment.all
        end
    end

    def show
        if params[:client_id]
          client = Client.find_by(id:params[:client_id])
          @appointment = client.appointments.find_by(id:params[:id])
          if !@appointment
            flash[:alert] = "Appointment not found."
            redirect_to client_appointments_path(client)
          end
        else
          @appointment = Appointment.find(params[:id])
        end
    end
    # def index 
    #     # if params[:client_id]
    #     #     @appointments = Client.find(params[:client_id]).appointments
    #     # else 
    #     #     @appointments = Appointment.all 
    #     # end 


    #     if params[:client_id] && @client = Client.find_by_id(params[:client_id])
    #         @appointments = @client.appointments
    #     else
    #         @error = "That client doesn't exist" if params[:client_id]
    #         @appointments = Appointment.all
    #     end
    # end 

    def new 
        @appointment = Appointment.new 
    end 

    def create 
        #binding.pry 
        @appointment = current_client.appointments.build(appointment_params)
       
        if @appointment.save 
            redirect_to @appointment
        else 
            render :new 
        end 
    end 

    def edit
      if params[:client_id]
        client = Client.find_by(id:params[:client_id])
        if client
          @appointment = client.appointments.find_by(id:params[:id])
          redirect_to client_appointments_path(client) if !@appointment
        else
          redirect_to clients_path, alert: "Client not found"
        end
      else
        @appointment = Appointment.find(params[:id])
      end
    end

    def update 
      @appointment = Appointment.find(params[:id])
      @appointment.update(appointment_params)
      if @appointment.save
        redirect_to @appointment
      else
        render :edit
      end
    end 

    def destroy
      @appointment = Appointment.find(params[:id])
      @appointment.destroy
      flash[:notice] = "Appointment deleted."
      redirect_to appointments_path
    end
   

    private 

    def appointment_params
        params.require('appointment').permit(:special_request, :desired_time, :desired_date, :client_id, :treatment_id)
    end
end
