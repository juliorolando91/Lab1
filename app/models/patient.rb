class Patient < ActiveRecord::Base

	def show_appointments 
		Appointment.where(:patient_id => id)
	end
	
end
