# MASTERMIND
# 2020 matdms

# main

require_relative "board.rb"
require_relative "player.rb"


=begin

TODO
Try and create 1 file par class
and just leave the main loop in here
  require_relative "mon_fichier.rb"


STRUCTURE
  Classes
    Board
      #initialize(nom_joueur, code, propositions, reponses)
      #display()
    Player
      #initialize(name) > Ajouter le type (human / computer) et un role (codemaker / codebreaker)
      #display
      #play
    Game
      #initialize
        game = [partie1, partie2, ...]
      #display
    Partie
      #initialize
        partie = {  Codemaker => Player1
                    Codebreaker => Player2
                    Score => [score1, score2] }
      #display
    Code
      :code
      #initialize
        génère un nouveau code
      #get_value
    Tentative
      #initialize
      #check_valid
      #get_feedback


  Fonctions
    check_valid(tentative)    > en méthode de Tentative
    gen_reponse(try, code)    > en méthode de Tentative
    nouvelle_partie(joueur)   > Transformer en méthode de Partie ?

  Main Loop

=end


# FONCTIONS

# check validité proposition joueur
def check_valid(tentative)
  a = 0 # reste à 0 tant que la tentative est valide
  tentative.length != 4 ? a += 1 : a
  tentative = tentative.split(//)
  tentative.map! { |n| n.to_i}
  tentative.each { |n| n > 6 ? a += 1 : a}
  tentative.each { |n| n < 1 ? a += 1 : a}

  # si tout est ok, on renvoi un array de la tentative, sinon false
  if a == 0
    return tentative #.split(//)
  else 
    return false
  end
end

def gen_reponse(try, code)
  rep=[]
  a = [0, 0, 0, 0, 0, 0] # bon nb + bonne position
  b = [0, 0, 0, 0, 0, 0] # bon nb, mauvaise pos  
  c = 0 # les autres
  for i in 1..6
    cc = code.count(i)
    ct = try.count(i)
    for j in 0..3
      if (code[j] == i && try[j] == i)
        a[i-1] += 1
      end
    end
    b[i-1] = [cc, ct].min - a[i-1]
  end
  c = 4 - a.sum - b.sum
  (a.sum).times { rep.push("+")}
  (b.sum).times { rep.push("-")}
  c.times { rep.push(".")}
  return rep
end

def nouvelle_partie(joueur)
  game = 1
  tour = 0
  win = 0
  # array du code, des propositions, des reponses
  code = []
  propositions = []
  12.times { propositions.push(["-", "-", "-", "-"]) }
  reponses = []
  12.times { reponses.push([" ", " ", " ", " "])}

  # generer le code
  base = [1, 2, 3, 4, 5, 6]
  4.times { code.push(base.sample) }

  # creer une board
  partie = Board.new(joueur.name, code, propositions, reponses)
  
  # boucle des essais du joueur
  until game != 1 do
    tour += 1
    tour >= 12 ? game = 0 : game = 1
    partie.display
    puts "Code = 4 chiffres de 1 à 6 (ex: 1234)"
    puts "  + => Valeur et position OK"
    puts "  - => Valeur OK"
    puts "  . => NOK"
    puts " "
    puts "Nouvelle tentative ?"
    tentative = gets.chomp
    if check_valid(tentative)
      # verifie que la reponse est valide
      new_try = check_valid(tentative)
      partie.propositions[tour-1] = new_try
      # generer la reponse
      partie.reponses[tour-1] = gen_reponse(new_try, code)
    else 
      partie.propositions[tour-1] = ["E", "R", "R", "."]
      partie.reponses[tour-1] = ["e", "r", "r", "."]
    end

    #check win
    if partie.reponses[tour-1] == ["+", "+", "+", "+"]
      win = 1
      
      game = 0
    end

  end

  partie.display
  if win == 1
    puts " "
    puts "YOU WIN"
    # tries.push(tour)
  end
  puts "Tries: #{tour}"
  puts " "
  puts "Fin de partie"
  puts "Rejouer ? (O/N)"
  rejouer = gets.chomp
  ( rejouer == "N" || rejouer == "n" ) ? (return 0) : (return 1)

end


# MAIN LOOP

# Loop de déroulement des parties
jouer = 1     # rejouer tant que == 1
nbr_game = 0  # nombre de parties jouées
# tries = []  # pour calculer la moyenne du nb d'essais

# creer un joueur
joueur = Player.new("Mathieu")

until jouer == 0 do
  nbr_game += 1
  jouer = nouvelle_partie(joueur)
end


# Fin du jeu 
puts " "
puts "Nombre de parties jouées: #{nbr_game}"
# puts "Victoires: "
# puts "Nbre de coups moyen: "
puts " "
puts "bye bye"
puts " "
