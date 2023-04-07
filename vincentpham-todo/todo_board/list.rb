require_relative 'item'

class List
    attr_accessor :label, :items
    def initialize(label)
        @label=label
        @items=[]
    end

    def add_item(title,deadline, description='')
        if Item.valid_date?(deadline)
            self.items.push(Item.new(title,deadline,description))
        else
            return false
        end

    end

    def size
        @items.length
    end

    def valid_index?(index)
        if index >@items.length-1 || index<0
            return false
        else
            return true
        end
    end

    def swap(index1,index2)
        self.items[index1], self.items[index2] = self.items[index2], self.items[index1]
    end

    def [](index)
        if valid_index?(index)
            return self.items[index]
        else
            return nil
        end
    end

    def priority
        self.items.first
    end

    def print
        puts '------------------------------------------'
        puts '               GROCERIES                  '
        puts "-".ljust(42,'-')
        puts 'Index' + ' | ' +'Item'.ljust(21)+'| ' + "Deadline"
        puts "-".ljust(42,'-')
        self.items.each_with_index do |item,i|
            puts "#{i}".ljust(6)+'| ' +"#{item.title}".ljust(21)+ '| ' +"#{item.deadline}"
        end
        puts "-".ljust(42,'-')
    end

    def print_full_item(index)
        if self.valid_index?(index)
            puts "-".ljust(42,'-')
            puts "#{self[index].title}".ljust(32) + "#{self[index].deadline}"
            puts "#{self[index].description}".ljust(42)
            puts "-".ljust(42,'-')
        else
            puts 'not on the list'
        end
    end

    def print_priority
        if self.valid_index?(index)
            puts "-".ljust(42,'-')
            puts "#{self.priority.title}".ljust(32) + "#{self.priority.deadline}"
            puts "#{self.priority.description}".ljust(42)
            puts "-".ljust(42,'-')
        else
            puts 'not on the list'
        end
    end

    def up(index,amount=1)
        if self.valid_index?(index)
            new_index = index 
            amount.times do 
                if new_index==0
                    break
                end
                self.swap(new_index,new_index-1)
                new_index-=1
            end
            return true
        else
            return false
        end
    end

    def down(index,amount=1)
        if self.valid_index?(index)
            new_index = index 
            amount.times do 
                if new_index==self.size-1
                    break
                end
                self.swap(new_index,new_index+1)
                new_index+=1
            end
            return true
        else
            return false
        end
    end

    def sort_by!
        self.items.sort_by! {|e| e.deadline}
    end






end 