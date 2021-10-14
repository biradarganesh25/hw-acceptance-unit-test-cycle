require 'rails_helper.rb'

describe Movie do
    fixtures :movies

    describe "Search movies by same director" do

        it "should get all the movies by the same director if director exists" do
        expected_titles=['Aladdin','My hero academia']
        got_movies = Movie.with_director('dir1')
        actual_titles=[]
        got_movies.each do |movie|
            actual_titles << movie.title
        end
        expect(actual_titles).to eq(expected_titles)
        end

        it "should return active record relation of size 0 f director does not exist" do
            expect(Movie.with_director('random_stuff').length).to eq(0)
        end

    end
end