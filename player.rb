# Player
class Player
  attr_accessor :name, :genre, :role

  def initialize(name, genre="computer", role="Codemaker")
    @name = name
    @genre = genre
    @role = role
  end
  
end