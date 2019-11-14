require 'colorize'

$input_hash = {}
user_name = ""

def puts_error msg
    puts "Erro: #{msg}".on_red
end

def read_comm_args
    user_input = ARGV.dup
    # print ARGV
    # print user_input
    input_error = false
    for input in user_input
        key_value = input.split("=")
        # puts key_value

        case key_value.length
        when 0
            puts_error "invalid arg ="
            input_error = true
            break
        when 1
            if(key_value[0][0] == "-")
                $input_hash[key_value[0].sub("-","").to_sym] = true
            else
                input_error = true
                puts_error "can not find argument name for value \"#{key_value[0]}\"."
                break
                end
        when 2
            if key_value[0][0] == "-"
                $input_hash[key_value[0].sub("-","").to_sym] = key_value[1]
            else 
                puts_error "invalid argument name #{key_value[0]} for value \"#{key_value[1]}\"."
                input_error = true
                break
            end            
        end
    end
    return input_error
end

def read_user_name
    user_name = $input_hash[:username]
    if (user_name == nil)
        puts "Please enter your name: "
        user_name = gets.chomp
    end
    return user_name
end

def print_help
    need_help = $input_hash[:help]
    if (need_help == nil)
        puts "Do you know how to play the game? "
        puts "Press enter if you know any other key to know how to play snake."
        play = gets.chomp
        need_help = play == ""? nil : play
    end

    if need_help != nil then 
        puts "need help."
    end
end
