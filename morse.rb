
def morse(line)
  message = ''
  line.split('  ').each do |word|
    word.split(' ').each do |char|
      message += ALPHA[MORSE.index(char)]
    end
    message += " "
  end
  puts message

end

MORSE = [".-","-...","-.-.","-..",".","..-.","--.","....",
  "..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.",
  "...","-","..-","...-",".--","-..-","-.--","--..", ".----", "..---", "...--",
  '....-', '.....', '-....', '--...', '---..', '----.', '-----' ]
ALPHA = %w[A B C D E F G H I J K L M N O P Q R S T U V W X Y Z 1 2 3 4 5 6 7 8 9 0]

# File.open(ARGV[0]).each_line do |line|
File.open('test.txt').each_line do |line|
  morse(line.strip)
end
