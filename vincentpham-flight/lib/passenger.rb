class Passenger
    attr_reader :name
    def initialize(name)
        @flight_numbers=[]
        @name =name
    end

    def has_flight?(num)
    @flight_numbers.include?(num.upcase)
    end

    def add_flight(flight_number)
       if !self.has_flight?(flight_number)
        @flight_numbers.push(flight_number.upcase)
       end
    end

end