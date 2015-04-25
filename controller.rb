require 'sinatra'
require_relative 'models/movie'

get '/' do
  redirect "/movies"
end

# Create route to show all movies
get '/movies' do
  @movies = Movie.all
  erb :index
end


# Create route to show form for a new movie
get '/movies/new' do
  erb :new
end

# Create route to create a new movie when form is submitted
post '/movies' do
  @movie = Movie.create({:title => params[:title], :director => params[:director], :rating => params[:rating]})
  redirect "/movies"
end

# Create route to show one specific movie by ID
get '/movies/:id' do
  @movie = Movie.find(params[:id])
  erb :show
end

# Create route to show form to edit one specific movie
get '/movies/:id/edit' do
  @movie = Movie.find(params[:id].to_i)
  erb :edit
end

# Create route to update movie when edit form is submitted
patch '/movies/:id' do
  @movie =  Movie.find(params[:id].to_i)
  @movie.title = params[:title]
  @movie.director = params[:director]
  @movie.rating = params[:rating]

  redirect "/movies"
end

# Create route to delete a movie
delete '/movies/:id' do
  @movie = Movie.find(params[:id].to_i)
  @movie.destroy
  redirect "/movies"

end



