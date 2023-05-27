Bookmark.destroy_all
Movie.destroy_all
List.destroy_all

mov_url = 'https://image.tmdb.org/t/p/w500'
movies = URI.open('https://tmdb.lewagon.com/movie/top_rated').read

movies_json = JSON.parse(movies)
movies_array = movies_json["results"]

movies_array.each do |movie|
  poster = movie['poster_path']
  movie = Movie.new(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500#{poster}",
    rating: movie['vote_average']
  )
  movie.save!
end

List.create(name: "Classics_vol1")
List.create(name: "Classics_vol2")
