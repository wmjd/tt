require 'io/console'

def rand_char
  (("a".ord) + rand(26)).chr
end

def rand_word n
  word = ''
  for _ in 1..n do word += rand_char end
  return word
end

def user_attempt target
  puts target
  input = ''
  while (input != target) && target[input] do
    system("stty raw -echo")
    input += STDIN.getc
    system("stty -raw echo")
    if input[-1] == '~' then exit end
  end
  return input
end

def main
  puts "Exit with tilde: ~"
  word_length = 1
  while true do
    target = rand_word word_length
    if (user_attempt target) != target
      while (user_attempt target) != target do end
      word_length = 0
    else
      word_length += 1 
    end
  end
end

main #entry point
