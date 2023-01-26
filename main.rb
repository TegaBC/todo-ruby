app_live = true

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
     
    if todos.count == 0
        puts "No todos fount in storage..."
        return
    end

    todos.each_index {|i|
        puts "[#{+1}] Name: #{todos[i].name}"
    }

    puts "Select a number of the TODO you would like to view."
    wanted_index = gets.chomp.to_i - 1
    todo = todos[wanted_index]

    if todo
        puts "Here is the TODO requested!"

        puts "Name: #{todo.name}"
        puts "Descrptiopn: #{todo.description}"
        puts "Completed?: #{todo.completed}"
    else
        puts "Number does not correspond with a TODO."
    end
end

def complete_command
    todos = TODO.todos
     
    if todos.count == 0
        puts "No todos fount in storage..."
        return
    end

    todos.each_index {|i|
        puts "[#{i+1}] Name: #{todos[i].name}"
    }

    puts "Select a TODO to toggle completion for."

    wanted_index = gets.chomp.to_i - 1

    todo = todos[wanted_index]

    if todo
        todo.completed= true
        puts "Todo completion has been toggled to: #{todo.completed}."
    else
        puts "Number does not correspond with a TODO."
    end
end

while app_live

    puts "Choose a command to run: (new, view, complete, exit)"
    command = gets.chomp

    # See if it is a valid command
    case command
    when "new"
        new_command
    when "view"
        view_command
    when "complete"
        complete_command
    when "exit"
        app_live = false
    else
        puts command + " is not a valid command!"
    end

end
