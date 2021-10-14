class Movie < ActiveRecord::Base

    def self.with_director director
        @movies = self.where("director = '#{director}'")
    end

end
