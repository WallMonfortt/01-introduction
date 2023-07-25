# puts is a method that prints the output to the screen like console.log in JS
puts 123

# Variables
# Variables are like containers for storing data

x = 10.0
y = 3
z = x / y

puts z.floor, z.ceil, z.round, z

# Strings
# Strings are a collection of characters
# Strings are defined by single or double quotes

name = "John"
age = 30
last_name = "Doe"
full_name = name + " " + last_name

puts name + " " + last_name # John Doe
puts 1 * 5 # 5
puts "1" * 5 # 11111

puts full_name.reverse # eoD nhoJ # reverse method

puts "\ta\tb\tc" # \t is a tab

empty_array = []

my_array = ["a", "b", "c", 1, 2, 3]
puts my_array[0] # a
puts my_array[6] # nil

double_array = [1,2,[1, 2, 3], 5 ,6 ,7 ,8]
puts double_array.size # 7
reverse_array = double_array.reverse # [8, 7, 6, 5, [1, 2, 3], 2, 1]
puts reverse_array.include?("s") # false

# Hashes
# Hashes are like objects in JS
# Hashes are a collection of key value pairs

my_hash = {
    "name" => "John",
    "age" => 30,
    "last_name" => "Doe"
}

puts my_hash["name"] # John

# Symbols
# Symbols are like strings but they are immutable
# Symbols are defined by a colon

my_hash_symbol = {
    :name => "John",
    :age => 30,
    :last_name => "Doe"
}

# With symbols ruby will not create a new object in memory



# Excercerise 1
# Create a function to convert a number into a roman number 

number = 3999

def romano(num)

    #Veificar que el número esté entre 1 y 3999
    raise ArgumentError, 'debe estar entre 1 y 3999' unless num > 0 && num < 4000
    # Crear un hash con los valores de los símbolos y sus representaciones en números romanos
    valores = {
      1000 => "M",
      900 => "CM",
      500 => "D",
      400 => "CD",
      100 => "C",
      90 => "XC",
      50 => "L",
      40 => "XL",
      10 => "X",
      9 => "IX",
      5 => "V",
      4 => "IV",
      1 => "I"
    }
  
    # Inicializar un string vacío que contendrá la representación en números romanos del número dado
    romano = ""
  
    # Recorrer el hash de valores y actualizar el número y la representación romana mientras el número sea mayor o igual al valor actual
    valores.each do |valor, letra|
        puts "valor: #{valor}, letra: #{letra}, condicion: #{num >= valor}"
      while num >= valor
        puts "num: #{num}, valor: #{valor}, letra: #{letra}"
        num -= valor
        romano += letra
      end
    end
  
    # Devolver la representación en números romanos
    romano
  end

  
puts romano(number) # XV


# Excercerise 2 blanked patterns

#input RRGGYYKK

#output
# RRGGYYKK
# RGGYYKKR
# GGYYKKRR
# GYYKKRRG
# YYKKRRGG
# YKKRRGGY
# KKRRGGYY
# KRRGGYYK
# RRGGYYKK
# REPEAT the same pattern twice

def blanked_pattern(pattern)
    cyles = 3
    pattern = pattern.split('')
    while cyles != 0
        pattern.each_with_index do |value, index|
            if index == 0
                puts pattern.join('')
            else
                pattern.push(pattern.shift)
                puts pattern.join('')
            end
        end
        cyles -= 1
    end
end

blanked_pattern("++*~~*++*")


# Video Solution 2

colors = "RRGGBBYYKK"
lines = 20 

count = 0

while count < lines # 0 < 20
    start = count.modulo(colors.length) # the remainder of count / colors.length
    firsr_half = colors[start..-1] # the range from start to the end of the string
    second_half = colors[0...start] # the range from the beginning of the string to start
    puts firsr_half + second_half # print the two halves together
    count += 1 # increment the count
end

# Another solution
colors_2 = "RRGGBBYYKK"
lines_2 = 20

lines_2.times do |i|
    first = colors[0]
    rest = colors[1..-1]
    colors = rest + first
    puts colors
end

#Another solution
colors_3 = "++*~~*++*"
lines_3 = 20

colors_array = colors_3.split('')
1.upto(lines_3) do |i|
    first = colors_array.shift
    colors_array << first
    puts colors_array.join('')
end

# Fancy pattern
fancy = "=|/|/|=|/|"
lines_4 = 20
halfway = (lines_4 / 2).floor

fancy_array = fancy.split('')

# Output the first half
1.upto(halfway) do |i|
    first = fancy_array.shift
    fancy_array << first
    puts fancy_array.join
end

# swap the array
fancy_array.length.times do |x|
    if fancy_array[x] == '/'
        fancy_array[x] = '\\'
    end
end
puts fancy_array.join

# Output the second half
(halfway).upto(lines_4) do |i|
    last = fancy_array.pop
    fancy_array.unshift(last)
    puts fancy_array.join
end

# Arguments 
# Arguments are the values that are passed into a method
# Parameters are the variables that are used to store the arguments

def volume(length, width, height)
    length * width * height
end

puts volume(10, 5, 2) # 100

# Default Arguments
# Default arguments are arguments that are given a default value
# If no argument is passed in the default value will be used

def volume_2(length = 1, width = 1, height = 1)
    length * width * height
end

puts volume_2(10, 5) # 50