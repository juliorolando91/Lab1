class Medic < ActiveRecord::Base
	
	def show_appointments 
		Appointment.where(:medic_id => id)
	end

end
