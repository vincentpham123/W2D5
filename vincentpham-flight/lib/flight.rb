

class Flight
    attr_reader :passengers
    def initialize(flight_num, capacity)
        @flight_number = flight_num
        @passengers=[]
        @capacity = capacity
    end

    def full?
        self.passengers.length == @capacity
    end

    def board_passenger(passenger_instance)
        if passenger_instance.has_flight?(@flight_number) && !self.full?
            @passengers.push(passenger_instance)
        end
    end

    def list_passengers
        @passengers.map{|passenger| passenger.name}
    end

    def [](index)
        @passengers[index]
    end

    def <<(passenger_instance)
        self.board_passenger(passenger_instance)
    end
end



        


