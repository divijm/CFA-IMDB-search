#####
class Person
  def initialize(name)
    @name = name
  end

  attr_accessor :name

end
#####
class Actor < Person
  def initialize(name, acting_style)
    super(name)
    @acting_style = acting_style
  end

  attr_accessor :acting_style
end
#####
class Director < Person
  def initialize(name)
    super(name)
  end

  def filmography
    #some method that returns all the movies that is directed by this directed
  end

end
#####
class Movie
  def initialize(title, description, actors, directors)
    @title = title
    @description = description
    @actors = actors
    @directors = directors
  end

  attr_accessor :title, :description, :actors, :directors

  #class level methods -->
  #file read
  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def self.search(search)
    #get all movies
    movies = self.all
    # return only matches in all attributes
    movies.select do |movie|
      movie.title
    end 
  end
end
#####

leo = Actor.new("Leo", "bad")
wally = Director.new("Wally")
findingnemo = Movie.new("Finding Nemo", "test", leo, wally)
findingdory = Movie.new("Finding Dory", "test", leo, wally)

puts Movie.all.count

Movie.all.each do |movie|
  puts movie.title
end
