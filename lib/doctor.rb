class Doctor
    attr_accessor :name
    @@all = []
    def initialize(name)
        @name = name 
        @@all << self
    end

    def self.all
        @@all
    end

    def new_appointment(patient, date)
        Appointment.new(date, patient, self)
    end

    def appointments
        Appointment.all.select do |single_appointment|
            single_appointment.doctor == self
        end
    end
    
    def patients 
        self.appointments.map {|appointment| appointment.patient}
    end


end