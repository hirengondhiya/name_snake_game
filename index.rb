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

def empty_board width, height
    board = []
    for y in 0..(height+2)
        row = []
        for x in 0..(width+2)
            # puts "x: #{x} y: #{y} width: #{width+2} height: #{height+2}"
            # print "Pushing "
            if (y==0 || y == height+2 )
                # puts "y==0: #{y==0} || y == height+2: #{y == height+2} || x == 0: #{x == 0} || x == width+2: #{x == width+2}"
                # puts "|"
                row.push("-")
            elsif (x == 0 || x == width+2)
                row.push("|")
            else
                # puts "space"
                row.push(" ")
            end
            # gets.chomp
        end
        board.push(row)
    end
    return board
end

def print_board board
    for y in 0...board.length
        row = board[y]
        for x in 0..row.length
            print board[y][x]
        end
        puts ""
    end
end

def game_play
    is_error = read_comm_args
    board = empty_board 20, 10

    if (!is_error)
        user_name = read_user_name
        print_help
        
        system("clear")
        print_board board 
    end
end

game_play