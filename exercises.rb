# Instructions
# Tally the results of a small football competition.
# 
# Based on an input file containing which team played against which and what the outcome was, create a file with a table like this:
# 
# Team                           | MP |  W |  D |  L |  P
# Devastating Donkeys            |  3 |  2 |  1 |  0 |  7
# Allegoric Alaskans             |  3 |  2 |  0 |  1 |  6
# Blithering Badgers             |  3 |  1 |  0 |  2 |  3
# Courageous Californians        |  3 |  0 |  1 |  2 |  1
# What do those abbreviations mean?
# 
# MP: Matches Played
# W: Matches Won
# D: Matches Drawn (Tied)
# L: Matches Lost
# P: Points
# A win earns a team 3 points. A draw earns 1. A loss earns 0.
# 
# The outcome is ordered by points, descending. In case of a tie, teams are ordered alphabetically.
# 
# Input
# Your tallying program will receive input that looks like:
# 
# Allegoric Alaskans;Blithering Badgers;win
# Devastating Donkeys;Courageous Californians;draw
# Devastating Donkeys;Allegoric Alaskans;win
# Courageous Californians;Blithering Badgers;loss
# Blithering Badgers;Devastating Donkeys;loss
# Allegoric Alaskans;Courageous Californians;win
# The result of the match refers to the first team listed. So this line:
# 
# Allegoric Alaskans;Blithering Badgers;win
# means that the Allegoric Alaskans beat the Blithering Badgers.
# 
# This line:
# 
# Courageous Californians;Blithering Badgers;loss
# means that the Blithering Badgers beat the Courageous Californians.
# 
# And this line:
# 
# Devastating Donkeys;Courageous Californians;draw
# means that the Devastating Donkeys and Courageous Californians tied.
# 
# How to debug
# When a test fails, a message is displayed describing what went wrong and for which input. You can inspect arbitrary values in your program by passing them to the debug method. This will capture the values and show you the output.
# 
# debug "The value is #{value}."
# debug "The input is #{input.inspect}"

require 'minitest/autorun'



class Tournament
    def self.tally(input)
        #En el constructor Hash.new, se especifica un bloque con la sintaxis { |h, k| h[k] = { mp: 0, w: 0, d: 0, l: 0, p: 0 } }. 
        # Este bloque se ejecutará cada vez que se intente acceder a una clave que no existe en el hash teams. 
        # El bloque toma dos argumentos, h y k, que representan el hash (teams) y la clave que se intenta acceder respectivamente.
      teams = Hash.new { |h, k| h[k] = { mp: 0, w: 0, d: 0, l: 0, p: 0 } }
  
      # El método each_line itera sobre cada línea del string input.
      input.each_line do |line|
        # El método next se ocupa para saltar a la siguiente iteración del ciclo. en caso de que la línea esté vacía o comience con el caracter '#'.
        # El método strip elimina los espacios en blanco al principio y al final de la línea.
        # El método empty? devuelve true si el string está vacío.
        next if line.strip.empty? || line.strip.start_with?('#')
        # El método strip elimina los espacios en blanco al principio y al final de la línea.
        # El método split divide la línea en tres partes, separadas por el caracter ';' y estas son asignadas a las variables
        # team1, team2 y result respectivamente.
        team1, team2, result = line.strip.split(';')
        # El método case es similar al switch de otros lenguajes de programación.
        case result
        # En caso de que la variable result sea igual a 'win', se incrementa el valor de la clave :w del hash teams para el equipo team1.
        # De igual forma, se incrementa el valor de la clave :l del hash teams para el equipo team2.
        when 'win'
            teams[team1][:w] += 1
            teams[team1][:p] += 3
            teams[team2][:l] += 1
        # En caso de que la variable result sea igual a 'draw', se incrementa el valor de la clave :d del hash teams para ambos equipos.
        when 'draw'
            teams[team1][:d] += 1
            teams[team1][:p] += 1
            teams[team2][:d] += 1
            teams[team2][:p] += 1
        # En caso de que la variable result sea igual a 'loss', se incrementa el valor de la clave :l del hash teams para el equipo team1.
        # De igual forma, se incrementa el valor de la clave :w del hash teams para el equipo team2.
        when 'loss'
            teams[team1][:l] += 1
            teams[team2][:w] += 1
            teams[team2][:p] += 3
        end
        # Se incrementa el valor de la clave :mp del hash teams para ambos equipos.
        teams[team1][:mp] += 1
        teams[team2][:mp] += 1
      end

      # Resultado final
      # primero asignamos lo que sera la cabeceera de la tabla
      result = "Team                           | MP |  W |  D |  L |  P\n"
      # Ahora ordenamos de acuerdo a los puntos, de mayor a menor y en caso de empate, por orden alfabetico
      # El metodo sort_by devuelve un array de arrays, donde cada subarray contiene dos elementos, la clave y el valor del hash teams.
      # El método sort_by toma un bloque que se ejecuta para cada elemento del array.
      # Each do |team, data| se ocupa para iterar en cada elemento.
      sorted_teams = teams.sort_by { |_team, data| [-data[:p], -data[:w], _team] }
        # Ahora formateamos el resultado
        # El método result += se ocupa para concatenar el string resultante con el string result.
        # Em metodo format se ocupa para darle formato a un string.
        # El primer argumento es un string que contiene el formato que se le dará al string resultante.
        # El placeholder %-31s indica que se le asignará un string de 31 caracteres al argumento.
        # El placeholder %d indica que se le asignará un número entero al argumento.
        # El segundo argumento es el valor que se le asignará a cada placeholder del string.
        # El segundo argumento es el nombre del equipo.
        # El tercer argumento es el valor de la clave :mp del hash teams para el equipo.
    sorted_teams.each do |team, data|
        result += format("%-31s|  %d |  %d |  %d |  %d |  %d\n", team, data[:mp], data[:w], data[:d], data[:l], data[:p])
        end
  
        # Devolver el resultado final
      result
    end
  end

class TournamentTest < Minitest::Test
    def test_ensure_points_sorted_numerically
        #skip
        input = <<~INPUT
        Devastating Donkeys;Blithering Badgers;win
        Devastating Donkeys;Blithering Badgers;win
        Devastating Donkeys;Blithering Badgers;win
        Devastating Donkeys;Blithering Badgers;win
        Blithering Badgers;Devastating Donkeys;win
        INPUT
        expected = <<~TALLY
        Team                           | MP |  W |  D |  L |  P
        Devastating Donkeys            |  5 |  4 |  0 |  1 | 12
        Blithering Badgers             |  5 |  1 |  0 |  4 |  3
        TALLY
        assert_equal expected, Tournament.tally(input)
    end
end
  

TournamentTest.test_ensure_points_sorted_numerically()