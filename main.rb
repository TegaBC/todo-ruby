
commands = ["new", "view", "complete"],

class TODO
    @@todos = []

    attr_accessor :name, :description, :completed

    def initialize name, description=""
        @name = name
        @description = description
        @completed = false

        @@todos << self
    end

    def self.todos
        @@todos
    end    
end

def new_command
    puts "Enter name of new TODO"
    name = gets
    puts "Enter description of new TODO"
    description = gets

    if name == ""
        puts "Name is empty."
    else
        TODO.new name, description
        puts "New TODO has been created!"
    end
end

def view_command
    todos = TODO.todos

    todos.each_index {|i|
        puts "[#{i}] Name: #{todos[i].name}"
    }

    puts "Select a number of the TODO you would like to view."
    wanted_index = gets
    todo = todos[wanted_index]

    if 
        puts "Here is the TODO requested!"

        puts "Name: #{todo.name}"
        puts "Descrptiopn: #{todo.description}"
        puts "Completed?: #{todo.completed}"
    else
        puts "Number does not correspond with a TODO."
    end
end

while true

    puts "Choose a command to run: (new, view, complete)"
    command = gets

    # See if it is a valid command

    case  commands.index(command.downcase)
    when "new"

    when "view"

    when "complete"

    when "exit"
        return
    else
        puts command + " is not a valid command!"
    end
    
end