# Classes

# Board
class Board
  attr_accessor :code, :propositions, :reponses
  
  def initialize(nom_joueur, code, propositions, reponses)
    @nom_joueur = nom_joueur
    @code = code
    @propositions = propositions
    @reponses = reponses
  end

  def display()
    system "clear"
    puts "  **************"
    puts "  * MASTERMIND *"
    puts "  **************"
    puts " "
    puts "  Joueur: #{@nom_joueur}"
    puts ""
    puts "  CODE   X X X X"
    for i in 0..11 do
      j = 12-i-1
      puts "    #{j+1<10 ? ' ' : ''}#{j+1}   #{@propositions[j][0]} #{@propositions[j][1]} #{@propositions[j][2]} #{@propositions[j][3]}   #{@reponses[j][0]}#{@reponses[j][1]}#{@reponses[j][2]}#{@reponses[j][3]}"
    end
    puts " "
  end


end


# Player
class Player
  attr_reader :name
  def initialize(name)
    @name = name
  end
  

end



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


# initialisation
  # initialiser les variables
  # array du code, des propositions, des reponses
code = [0, 0, 0, 0]
propositions = [  ["-", "-", "-", "-"],
                  ["-", "-", "-", "-"],
                  ["-", "-", "-", "-"],
                  ["-", "-", "-", "-"],
                  ["-", "-", "-", "-"],
                  ["-", "-", "-", "-"],
                  ["-", "-", "-", "-"],
                  ["-", "-", "-", "-"],
                  ["-", "-", "-", "-"],
                  ["-", "-", "-", "-"],
                  ["-", "-", "-", "-"],
                  ["-", "-", "-", "-"], ]

reponses = [  [".", ".", ".", "."],
              [".", ".", ".", "."],
              [".", ".", ".", "."],
              [".", ".", ".", "."],
              [".", ".", ".", "."],
              [".", ".", ".", "."],
              [".", ".", ".", "."],
              [".", ".", ".", "."],
              [".", ".", ".", "."],
              [".", ".", ".", "."],
              [".", ".", ".", "."],
              [".", ".", ".", "."] ]

  # creer un joueur
joueur = Player.new("Mathieu")
# nom_joueur = joueur.name

  # generer le code
code = [1, 2, 3, 4]

  # creer une board
partie = Board.new(joueur.name, code, propositions, reponses)

  # lancer la boucle de la partie
game = 1
    # effacer / redessiner le jeu
    # demander une proposition au joueur
    # check validité de la proposition
    # traiter la proposition (générer une réponse)
    # loop

tour = 0

until game != 1 do
  tour += 1
  tour >= 12 ? game = 0 : game = 1
  partie.display
  puts "Nouvelle tentative ? (ex: 1234)"
  tentative = gets.chomp
  if check_valid(tentative)
    partie.propositions[tour-1] = check_valid(tentative)
    # generer la reponse
  else 
    partie.propositions[tour-1] = ["E", "R", "R", "."]
  end
end

partie.display
