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
    # puts "  CODE   #{code}"
    puts "  CODE   X X X X"
    for i in 0..11 do
      j = 12-i-1
      puts "    #{j+1<10 ? ' ' : ''}#{j+1}   #{@propositions[j][0]} #{@propositions[j][1]} #{@propositions[j][2]} #{@propositions[j][3]}   #{@reponses[j][0]}#{@reponses[j][1]}#{@reponses[j][2]}#{@reponses[j][3]}"
    end
    puts " "
  end


end