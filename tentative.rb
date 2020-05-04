# Tentative

class Tentative
  def initialize()
    puts "Nouvel essai ?"
    @essai = gets.chomp
  end

  def check_valid()
    a = 0 # reste à 0 tant que la tentative est valide
    @essai.length != 4 ? a += 1 : a
    @essai = @essai.split(//)
    @essai.map! { |n| n.to_i}
    @essai.each { |n| n > 6 ? a += 1 : a}
    @essai.each { |n| n < 1 ? a += 1 : a}
  
    # si tout est ok, on renvoi un array de la tentative, sinon false
    if a == 0
      return @essai
    else 
      return false
    end
  end
end
