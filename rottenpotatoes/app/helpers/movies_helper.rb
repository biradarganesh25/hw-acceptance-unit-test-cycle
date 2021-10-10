module MoviesHelper
  # Checks if a number is odd:
  def oddness(count)
    count.odd? ?  "odd" :  "even"
  end

  def get_movie_director(movie)
    if movie.director == nil
      return "N/A"
    end
    return movie.director
  end
end
