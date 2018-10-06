require 'rails_helper'

describe MoviesController do
  describe 'Search movies by the same director' do
    it 'should call Movie.filter_by_director' do
      expect(Movie).to receive(:filter_by_director)
      get :same_director, { id: 1, title: 'Aladdin' }
    end
  
    it 'should assign similar movies if director exists' do
      movies = ['Aladdin', 'The Terminator']
      Movie.stub(:filter_by_director).and_return(movies)
      get :same_director, { id: 1, title: 'Aladdin' }
      expect(assigns(:movies)).to eql(movies)
    end
    
    it "should redirect to home page if director isn't known" do
      Movie.stub(:filter_by_director).and_return(nil)
      get :same_director, { id:1, title: 'No name' }
      expect(response).to redirect_to(movies_path)
    end
    
  end
  
  
end