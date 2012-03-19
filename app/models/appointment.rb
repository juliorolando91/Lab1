class Appointment < ActiveRecord::Base
	
	def Appointment.assignAppointmet(medic_id, patient_id, begin_time, end_time)
		ap = Appointment.where(:medic_id => medic_id)
		valido = true
		ap.each do |cita|
			cita_b = cita["begin_time"].to_a
			cita_e = cita["end_time"].to_a
			cita_b = (cita_b[5].to_s+"-"+cita_b[4].to_s+"-"+cita_b[3].to_s+" "+cita_b[2].to_s+":00")
			cita_e = (cita_e[5].to_s+"-"+cita_e[4].to_s+"-"+cita_e[3].to_s+" "+cita_e[2].to_s+":00")
			if(begin_time == cita_b and end_time == cita_e) then valido=false end
		end
		if valido then Appointment.create(:medic_id => medic_id,:patient_id => patient_id,:begin_time => begin_time,:end_time => end_time) end
	end
	
	def Appointment.editAppointmet(appointment_id, medic_id, begin_time, end_time)
		ap = Appointment.where(:medic_id => medic_id)
		valido = true
		ap.each do |cita|
			cita_b = cita["begin_time"].to_a
			cita_e = cita["end_time"].to_a
			cita_b = (cita_b[5].to_s+"-"+cita_b[4].to_s+"-"+cita_b[3].to_s+" "+cita_b[2].to_s+":00")
			cita_e = (cita_e[5].to_s+"-"+cita_e[4].to_s+"-"+cita_e[3].to_s+" "+cita_e[2].to_s+":00")
			p cita_b
			if(begin_time == cita_b and end_time == cita_e) then valido=false end
		end
		p valido
		if valido then Appointment.update(appointment_id ,{:medic_id => medic_id,:begin_time => begin_time,:end_time => end_time}) end
	end
	
	def Appointment.deleteAppointmet(appointment_id)
		Appointment.delete(appointment_id)
	end
	
end
