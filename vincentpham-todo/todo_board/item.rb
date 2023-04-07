class Item
#accept due date, item, and description
    def self.leap_year_check(year)
        result=true
        if year%400==0
            return true
        elsif year%4==0 && year%100!=0
            return true
        else
            return false
        end
    end

   def self.valid_date?(date_string)
    if date_string.split('-').length !=3
        return false
    end
    date_check = date_string.split('-')
    if date_check[0].length !=4
        return false
    end
    date_check.map!(&:to_i)
    if date_check[1]<1 || date_check[1]>12
        return false
    end
    if date_check[2]<1 && date_check[2]>31
        return false
    end
    thirtyone_months = [1,12,3,10,5,8,7]
    thirty_months=[11,4,9,6]
    feb = 2
    if thirty_months.include?(date_check[2])
        if date_check[2] >30
            return false
        end
    end
    return false if date_check[1]==feb&& Item.leap_year_check(date_check[0])&& date_check[2]>29
    return false if date_check[1]==feb&& !Item.leap_year_check(date_check[0])&& date_check[2]>28
    return true
    end
            
    attr_accessor :title, :deadline, :description
    def initialize(title,deadline, description=nil)
        
        if !Item.valid_date?(deadline)
            raise ArgumentError.new 'Invalid date format'
        end
        @deadline = deadline
        @title=title
        @description = description

    end
    

end
