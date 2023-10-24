require 'io/console'
 
class TouchTyper
  def initialize
    word_length = 1
    loop do
      target = rand_word word_length
      if (user_attempt target) != target 
        while (user_attempt target) != target do end
        word_length = 0
      else
        word_length += 1 
      end
    end
  end   
 
  def rand_char
    (("a".ord) + rand(26)).chr
  end
  
  def rand_word n
    word = ''
    n.times { word += rand_char }
    return word
  end
  
  def user_attempt target
    puts target
    input = ''
    i = 0
    while (input != target) && (target[0...i] == input[0...i]) do
      system("stty raw echo")
      input += STDIN.getc
      system("stty -raw echo")
      if input[-1].ord == 3 then exit end #checks for ^C 
      i += 1
    end
    puts
    return input
  end
end

TouchTyper.new  
 
