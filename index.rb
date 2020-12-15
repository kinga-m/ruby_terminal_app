def read_int
    input = gets.chomp
    while input !~ /[0-9]+/
        puts "invalid input! please enter a number"
        input = gets.chomp
    end
    input.to_i
end

def quit
    puts "goodbye"
end

def main_menu
    puts "Welcome to the quiz"
    puts "short quiz[1]"
    puts "medium quiz[2]"
    puts "long quiz[3]"
    puts "quit[4]"
    input = gets.chomp
    if input == "1"
        puts "start quiz(1)"
    elsif input == "2"
        puts "start_quiz(2)"
    elsif input == "3"
        puts "start_quiz(3)"
    elsif input == "4"
        puts "quit"
    else
        puts "invalid input"
    end
end

main_menu