class Cat

  attr_reader :name, :owner, :mood
  attr_writer :owner, :mood
  
  @@all = []

  def initialize name, owner
    @name = name
    @owner = owner
    @mood = "nervous"
    @@all << self
  end

  def self.all
    @@all
  end

  

end