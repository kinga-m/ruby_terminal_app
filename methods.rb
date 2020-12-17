def read_int
    input = gets.chomp
    while input !~ /[0-9]+/
        puts "invalid input! please enter a number"
        input = gets.chomp
    end
    input.to_i

end
def quit
    puts "Goodbye"
end


def start_quiz(max_questions)
    question_pool = [
        {type: :multiple_choice, content: {options: ["toyota", "volkswagen", "holden", "mazda", "nissan"]}, correct_answer: 0, text: "What brand does the model corolla belongs to?".light_blue}, 
        {type: :raw, content: nil, correct_answer: ["mazda"], text: "What brand does the model CX5 belongs to?".red},
        {type: :raw, content: nil, correct_answer: ["nissan"], text: "What brand does the model Quasqai belongs to?".yellow},
        {type: :raw, content: nil, correct_answer: ["holden"], text: "What brand does the model Astra belongs to?".green},
        {type: :raw, content: nil, correct_answer: ["volkswagen"], text: "What brand does the model polo GTI belongs to?".blue},
    ]
    questions = question_pool.shuffle[0..max_questions-1]
    score = 0
    position = 0
    while position < questions.size
        question = questions[position]
        puts question[:text]
        case question[:type] 
        when :multiple_choice
            puts "choose one of the following options"
            options = question[:content][:options].shuffle
            options.each_with_index {|option, index| puts "#{option} [#{index + 1}]"}
            input = read_int 
            score += 1 if question[:content][:options][question[:correct_answer]] == options[input-1]
        when :raw
            input = gets.chomp
            score += 1 if question[:correct_answer].include? input.downcase 
        end
        position += 1
    end
    [score, questions.size]
end

def show_results(score, num_questions)
    percentage = (score.to_f / num_questions.to_f * 100).to_i
    puts "your score is #{percentage}"
    
end
