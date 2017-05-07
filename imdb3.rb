## shouheiya's code ## 

class Movie
  def initialize(title, description, actors, director)
    @title = title
    @description = description
    @actors = actors
    @director = director
  end

  attr_accessor :title, :description, :actors, :director

  # create method which is at class level to put all movie objects into an array
  def self.search_movie
    #type in search term
    print "Type in your search term: "
    input = gets.chomp.downcase
    #loop through all movies and search any Movie object which includes the search term in the title
    ObjectSpace.each_object(self).to_a.each do |movie|
      if movie.title.downcase.include? input
        puts "Title: #{movie.title}\nDescription: #{movie.description}\nActors: #{movie.actors} \nDirector: #{movie.director}\n\n"
      end
    end
  end
end

#add movies
superbad4 = Movie.new("Superbad 4", "Description of Superbad 4.", "Leonardo DiCaprio", "Wallice")
superbad3 = Movie.new("Superbad 3", "Description of Superbad 3.", "Leonardo DiCaprio", "Wallice")
inception = Movie.new("Inception", "Description of Inception.", "Leonardo DiCaprio", "Christopher Nolan")
socialnetwork = Movie.new("The Social Network", "Description of The Social Network", "Jesse Eisenberg", "David Fincher")

#search movie
Movie.search_movie
