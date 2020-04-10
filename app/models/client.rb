class Client < ApplicationRecord

    has_secure_password

    has_many :appointments
    has_many :treatments, through: :appointments 


    validates_presence_of :first_name, :last_name, format: { with: /\A[a-zA-Z]+\Z/ }, message:"Cannot be blank"
    validates_numericality_of :phone, on: :create
    validates :email, format: {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}, uniqueness: {message:"already belongs to an existing account"}

    
   


    # def self.google(auth)
    # #find_or_create a client using the attributes auth
    #     where(email: auth.info.email).first_or_initialize do |client|
    # #     @client = Client.find_or_create_by(email: auth["info"]["email"]) do |client|
    # #     client.first_name = auth["info"]["first_name"]
    # #     client.last_name = auth["info"]["last_name"]
    # #     client.password = SecureRandom.hex(10)
    #     end 
    # end 
end
