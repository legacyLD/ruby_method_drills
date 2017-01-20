#########################
#### USING ARGUMENTS ####
#########################

puts 'sanity check'

#say_hello
  # returns 'hello'
def say_hello
  return 'hello'
end

#echo
  # echoes (returns) the input string
def echo (word)
  word
end

#get_fruit
  # returns the fruit that corresponds to the given id
  # does not raise an error when the id argument is missing
  # defaults to 'apple' when no id argument is supplied

def get_fruit (id=0)
  ["apple", "pear"][id]
end

#how_many_args
  # accepts any number of arguments without error
  # returns the total number of arguments passed to the function

def how_many_args (*args)
  args.count
end

#find_answer
  # returns the value associated with the 'answer' keyword argument
  # returns nil if it cannot find the 'answer' keyword argument
  # raises an error when given non-keyword arguments

def find_answer (**key)
  key[:answer]
end

##############################
#### MANIPULATING STRINGS ####
##############################
#first_char
  # returns the first letter of the given word
  # lowercases the first letter of the given word

def first_char (word)
  word[0].downcase
end

#polly_wanna
  # includes the given word in its return value
  # repeats the given word 3 times

def polly_wanna (word)
  word*3
end

#count_chars
  # returns the number of characters in the given string

def count_chars (word)
  word.length
end

#yell
  # convert the given message to uppercase
  # adds an exclamation point to the end of the given message

def yell (word)
  word.upcase + "!"
end

#to_telegram
def to_telegram (sentence)
  sentence.gsub! '.', ' STOP'
end

#spell_out
def spell_out (string)
  spelled = string.downcase.split("").join("-")
end
p spell_out("hey")
  # returns the input string, with characters seperated by dashes
  # converts the input string to lowercase

#seperate
def seperate (string, sep="-")
  string.split("").join(sep)
end
  # seperates characters in the input string with a custom seperator, when supplied with one
  # seperates characters in the input string with dashes (by default)

#croon
def spell_out (string)
  string.downcase.gsub(/[^a-z ]/, '')
end
  # seperates characters in each word of the input phrase with dashes
  # preserves whitespace between words

#palindrome_word?
def palindrome_word?(word)
  word.downcase == word.downcase.reverse
end
  # determines whether a single given word is a palindrome
  # ignores case

#palindrome_sentence?
  # determines whether a given sentence is a palindrome
  # ignores case
  # ignores whitespace
  # ignores punctuation

#is_vowel
  # determines whether a given character is a vowel
  # ignores case
  # returns false for non-letter inputs

#add_period
  # adds a period to the end of the given sentence
  # does not add a period if one is already there
  # does not add a period if any form of terminal punctuation is present


###########################
#### LOOPS & ITERATORS ####
###########################
#count_spaces
  # counts the spaces in a given string
def count_spaces(word)
  count = 0
  space = " "

  word.each_char do |char|
    if char == space
      count += 1
    end
  end
  count
end

#string_lengths
def string_lengths(list)
  list.map {|str| str.length }
end

#remove_falsy_values
def remove_falsy_values(list)
  list.select { |item| !!item }
end

#exclude_last
def exclude_last(sequence)
  sequence[0..-2]
end

def exclude_first(sequence)
  sequence[1..-1]
end

#exclude_first
  # removes the first item from an input array
  # removes the first character from an input string
  # does not alter the original input (non-destructive)

#exclude_ends
  # removes the first and last items from an input array
  # removes the first and last characters from an input string

#select_every_even
  # returns an array of even-indexed items from the input array

#select_every_odd
  # returns an array of odd-indexed items from the input array

#select_every_n
  # returns an array of items at an index evenly divisible by n, from the input array
  # defaults to an n value of 1



##############################
#### MANIPULATING NUMBERS ####
##############################
#count_to
def count_to(n)
  n = n.to_i
  if n >= 0
    0.upto(n).to_a  # or (0..n).to_a
  else
    0.downto(n).to_a
  end
end


#is_integer?
def is_integer?(number)
  number.class == Fixnum || number.class == Bignum ||
  ( number.is_a?(Float) && !number.nan? && number.to_i == number )
end
  # returns true for Fixnums and Bignums (whole number or 'integer' types)
  # returns true for Floats (decimals) equal to integers
  # returns false for non-integer decimals
  # returns false for Float::NAN
  # returns false for non-numbers

#is_prime?
def is_prime?(numbers)
  if !is_integer?(numbers) || numbers <= 1 # checking if whole numbersber
    false
  elsif numbers <= 1 # checking if in range
    false
  else
    # this could be a prime! loop through and check divisibility
    (2..(numbers-1)).each do |n|
      if numbers % n == 0 # it's not prime
        return false  # break the loop early
      end
    end
    true
  end
end
  # returns false for non-integer decimals
  # returns false for numbers less than or equal to 1
  # returns false for numbers divisible by anything but 1 and themselves
  # returns true for prime numbers

#primes_less_than
def primes_less_than(numbers)
  primes = []
  (2..numbers-1).each do |n|
    if is_prime?(n)
      primes.push n
    end
  end
  primes
end
  # returns an empty array if there are no primes below numbers
  # does not return the number itself
  # finds all primes less than the given number

#iterative_factorial
  # returns 1 for 0 and 1
  # returns NaN for numbers less than 0
  # returns NaN for non-integers
  # calculates the factorial of the input number



##############################
#### MANIPULATING OBJECTS ####
##############################
#character_count
def character_count(sentence)
  char_counts = {}
  sentence.each_char do |char|
    char = char.downcase
    if char_counts[char].nil?
      char_counts[char] = 1
    else
      char_counts[char] += 1
    end
  end
  char_counts
end
  # returns a hash
  # counts how many times each character appears in the input string
  # ignores case

#word_count
def word_count(sentence)
  word_counts = {}
  sentence.split(" ").each do |word|
    word = word.downcase.gsub(/[^a-z]/i, "")
    if word_counts[word].nil?
      word_counts[word] = 1
    else
      word_counts[word] += 1
    end
  end
  word_counts
end
  # returns a hash
  # counts how many times a word appears in the input string
  # ignores case
  # ignores characters that are not in the sequence a-z

#most_frequent_word
def most_frequent_word(sentence)
  word_counts = word_count(sentence)
  word_counts.empty? ? nil : word_counts.invert.max[1]
end
  # finds the word in the input string that appears with the most frequency
