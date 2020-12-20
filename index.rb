require_relative('methods')
require 'colorize'

if ARGV.length > 0
    flag, *rest = ARGV
    ARGV.clear
    case flag
    when '-help'
        puts "Read the readme"
        exit
    when '-path'
        puts rest[0]
        exit
    when '-info'
        puts "This program is using Ruby version: #{RUBY_VERSION}"
        exit
    else
        puts "invalid argument"
        exit
    end
end

while true
    puts "Welcome to the quiz"
    puts "short quiz[1]"
    puts "medium quiz[2]"
    puts "long quiz[3]"
    puts "quit[4]"
    menu_input = gets.chomp.to_i

    case menu_input
    when 1
        show_results(*start_quiz(1))
    when 2
        show_results(*start_quiz(2))
    when 3
        show_results(*start_quiz(3))
    when 4
        puts "Are you sure, type 'yes' to quit"
        quit_choice = gets.chomp
        break if quit_choice.downcase == 'yes'
    else
        puts "invalid input"
    end
    puts "press any key to continue"
    gets 
    system "clear"
end

puts "Goodbye"
