require 'colorize'

require 'io/console'
$tail_value = 0
$input_hash = {}
HEIGHT = 10
WIDTH = HEIGHT * 2
DIR = {
    up: {
        x: 0,
        y: -1
    },
    down: {
        x: 0,
        y: 1
    },
    left: {
        x: -1,
        y: 0
    },
    right: {
        x: 1,
        y: 0
    },
}

class Snake
    attr_reader :head, :tail

    def initialize
        @size = {
            width: WIDTH,
            height: HEIGHT
        }
        @head = {
            x: @size[:width] / 4,
            y: @size[:height] / 2
        }
        @tail = []
        @dir = DIR[:right]
        @apple = { 
            x: @size[:width]/2,
            y: @size[:height]/2
        }
        draw(true)
    end

    def new_apple
        return {
            x: rand(WIDTH)+1,
            y: rand(HEIGHT)+1
        }
    end

    def create_apple
        n = new_apple
        while(n == @apple || @head == n || @tail.include?(n))
            n = new_apple
        end
        @apple=n
    end

    def go_up lines
        for y in 0...lines
            print "\r" + ("\e[A\e[K")
        end
    end

    def draw(first_draw=false)
        # puts "in draw"
        xchar = "*"
        ychar = "*"
        nchar = " "
        hchar = "@"
        tchar = "$"
        achar = "a".red

        if(!first_draw)
            go_up @size[:height]+2
        end

        for y in 0..@size[:height]+1
            for x in 0..@size[:width]+1
                p = {x:x, y:y}
                if (top_wall?(p) || bottom_wall?(p))
                    # puts "y==0: #{y==0} || y == height+1: #{y == height+1} || x == 0: #{x == 0} || x == width+1: #{x == width+1}"
                    # puts "|"
                    print ychar
                elsif (left_wall?(p) || right_wall?(p))
                    print xchar
                elsif (@apple == p)
                    print achar
                elsif (x==@head[:x] && y==@head[:y])
                    print hchar
                elsif @tail.include?(p)
                    # tail_node = (@tail.select {|t| t[:x]==x && t[:y]==y})
                    # tc = tail_node.length > 0 ? tail_node[0][:value] : tchar
                    # # tc = 
                    print tchar
                else
                    # puts "space"
                    print nchar
                end                    
            end
            print "\n"
        end
    end    

    def detect_tail_direction
        prev_node = @head.dup
        for current_node in tail
            current_node[:dir] = {
                x: prev_node[:x]-current_node[:x],
                y: prev_node[:y]-current_node[:y]
            }
            prev_node = {
                x: current_node[:x],
                y: current_node[:y]
            }
        end
        garbage=0
    end

    def change_dir_to=dir
        @dir=dir
    end

    def move
        curr_head_loc = @head.dup
        @head[:x] += @dir[:x]
        @head[:y] += @dir[:y]
        is_gameover = gameover?
        if (!is_gameover)
            if(@tail.length > 0)
                @tail.pop
                @tail.unshift(curr_head_loc)
            end
            eatapple?
            draw
        end
        return is_gameover
    end

    def eatapple?
        if (@head == @apple)
            if @tail.length > 0
                tail_end = @tail[@tail.length-1]
                tail_dir = @tail.length == 1? {
                    x: @head[:x] - tail_end[:x],
                    y: @head[:y] - tail_end[:y]
                } : {
                    x: @tail[@tail.length-2][:x] - tail_end[:x],
                    y: @tail[@tail.length-2][:y] - tail_end[:y]
                }
            else
                tail_end = @head
                tail_dir = @dir
            end
            # tail_end = @tail.length > 0? @tail[@tail.length-1] : @head
            # tail_end = @head.dup
            t = {}
            case tail_dir
            when DIR[:up]
                t = {
                    x: tail_end[:x],
                    y: tail_end[:y] + DIR[:down][:y]
                }
            when DIR[:down]
                t = {
                    x: tail_end[:x],
                    y: tail_end[:y] + DIR[:up][:y]
                }
            when DIR[:left]
                t = {
                    x: tail_end[:x] + DIR[:right][:x],
                    y: tail_end[:y]
                }
            when DIR[:right]
                t = {
                    x: tail_end[:x] + DIR[:left][:x],
                    y: tail_end[:y]
                }
            end
            @tail.push(t)
            create_apple
        else
            return false
        end
    end

    def left_wall?(n)
        return (n.is_a?(Integer) && n==0) || (n.is_a?(Hash) && n[:x]==0)
    end
    def right_wall?(n)
        return (n.is_a?(Integer) && n==@size[:width]+1) || (n.is_a?(Hash) && n[:x]==@size[:width]+1)
        # return (x == @size[:width]+1)
    end
    def top_wall?(n)
        # return (y == 0)
        return (n.is_a?(Integer) && n==0) || (n.is_a?(Hash) && n[:y]==0)
    end
    def bottom_wall?(n)
        # return y == @size[:height]+1
        return (n.is_a?(Integer) && n==@size[:height]+1) || (n.is_a?(Hash) && n[:y]==@size[:height]+1)
    end
    def gameover?
        is_game_over = @tail.include?(@head) || left_wall?(@head) || right_wall?(@head) || top_wall?(@head) || bottom_wall?(@head)
        if (is_game_over)
            puts "Gave over. Better luck next time!"
        end
        return is_game_over
    end
end

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
        puts File.read("help.txt").green

        puts "Press " + "any key".green + " to start playing the game."
        read_char
        system("clear")
    end
end

def read_char
    STDIN.echo = false
    STDIN.raw!
  
    input = STDIN.getc.chr
    if input == "\e" then
      input << STDIN.read_nonblock(3) rescue nil
      input << STDIN.read_nonblock(2) rescue nil
    end
  ensure
    STDIN.echo = true
    STDIN.cooked!
    return input
end

def game_play
    is_error = read_comm_args
    snake = Snake.new
    command = ""
    while command.upcase != "Q" && !snake.move
        prev_command = command.dup
        command = read_char
        if prev_command != command
            case command.upcase
            when "\e[A"
                snake.change_dir_to=DIR[:up]
            when "\e[B"
                snake.change_dir_to=DIR[:down]
            when "\e[D"
                snake.change_dir_to=DIR[:left]
            when "\e[C"
                snake.change_dir_to=DIR[:right]
            when "Q"
                puts "Are you sure you want to quit?"
                puts "Press " + "Enter to Quit".colorize(:red) + " any other key to resume".colorize(:green) + "..."
                confirm = read_char
                if (confirm == "\r")
                    puts "Good bye!"
                else
                    command = ""
                    snake.go_up 2
                end            
            when "P"
                puts "Press any key to resume...".colorize(:green)            
                read_char
                snake.go_up 1
            else
                system('feep -d 25')
            end
        end
    end
end

read_user_name
print_help
game_play
