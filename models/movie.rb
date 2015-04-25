class Movie

  attr_accessor :title, :director, :rating
  attr_reader :id

  @@all = []
  @@counter = 1

  def initialize(attributes={})
    @title = attributes[:title]
    @director = attributes[:director]
    @rating = attributes[:rating]
  end

  def save
    @id = @@counter
    @@all << self
    @@counter += 1
  end

  def update(attributes={})
    attributes.each do |key, value|
      self.send("#{key}=", value)
    end
  end

  def destroy
    @@all.delete(self)
  end

  def self.all
    @@all
  end

  def self.find(id)
    movie = self.all.find {|movie| movie.id == id.to_i}
  end

  def self.create(attributes={})
    movie = Movie.new(attributes)
    movie.save
  end

end


# USAGE

# New movie using create (set and save automatically)
 Movie.create({:title => "Raiders of the Lost Ark", :director => "Spielberg", :rating => 10})
Movie.create({:title => "Raiders of the storm", :director => "Spielberg", :rating => 11})

# New movie (set and save manually)
# m2 = Movie.new
# m2.title = "Raiders of the Lost Ark"
# m2.director = "Spielberg"
# m2.rating = 10
# m2.save

# Get all movies
# movies = Movie.all

# Find movie by ID
# m1 = Movie.find(1)

# Update a movie (any number of attributes)
# m1.update(:director => "Steven Spielberg")

# Destroy movie
# m2.destroy

