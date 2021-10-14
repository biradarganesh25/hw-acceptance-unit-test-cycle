require 'rails_helper.rb'

describe MoviesController do
    fixtures :movies
    # render_views
    describe "Search movies by same director" do

        it "should get all the movies by the same director if director exists" do
        expected_titles=['Aladdin','My hero academia']
        get :search_directors, :id=>1 
        got_movies = controller.instance_variable_get(:@movies)
        # expect(response.body).to have_content('Aladdin')
        actual_titles=[]
        got_movies.each do |movie|
            actual_titles << movie.title
        end
        expect(actual_titles).to eq(expected_titles)
        end

        it "should redirect with warning if movie does not have director" do
            get :search_directors, :id => 3
            expect(response).to redirect_to(movies_path)
            expect(flash[:warning]).to be_present
        end

    end
end