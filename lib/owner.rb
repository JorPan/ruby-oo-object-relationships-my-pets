require "pry"

class Owner

  attr_reader :name, :species
  
  @@all = []

  def initialize *name
    @name = name.join
    @species = "human"
    @@all << self
  end

  def self.all
    @@all
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear 
  end

  def cats
    Cat.all.select do |kitty|
      kitty.owner == self
    end
  end

  def dogs
    Dog.all.select do |doggo|
      doggo.owner == self
    end
  end

  def buy_cat(kitty)
    kat = Cat.all.find do |kitten|
      kitten.name == kitty
    end
    kat.owner = self
    self.cats
  end

  def buy_dog(doggy)
    hound = Dog.all.find do |doggo|
      doggo.name == doggy
    end
    hound.owner = self
    self.dogs
  end

  def walk_dogs
    self.dogs.map do |doggo|
      doggo.mood = "happy"
    end
  end

  def feed_cats
    self.cats.map do |kitty|
      kitty.mood = "happy"
    end
  end

  def sell_pets
    self.dogs.map do |doggo|
      doggo.mood = "nervous"
      doggo.owner = nil
    end
    self.cats.map do |kitty|
      kitty.mood = "nervous"
      kitty.owner = nil
    end
    self.dogs.clear
    self.cats.clear
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end


end

# binding.pry
0