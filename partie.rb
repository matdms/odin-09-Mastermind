# Partie
class Partie

  @@nbr_parties = 0
  @@score = [0, 0]

  def initialize(joueur1, joueur2)
    @joueur1 = joueur1
    @joueur2 = joueur2
    @@nbr_parties += 1
    if @joueur1.role == "Codemaker"
      @joueur1.role = "Codebreaker"
      @joueur2.role = "Codemaker"
    else
      @joueur1.role = "Codemaker"
      @joueur2.role = "Codebreaker"
    end
    @game = true
    @win = false
  end
  
  def display()
    puts "#{@joueur1.name} is The #{@joueur1.role}"
    puts "#{@joueur2.name} is The #{@joueur2.role}"
  end

end

