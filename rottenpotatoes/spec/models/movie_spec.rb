require 'rails_helper'

describe Movie do
  describe '.find_same_director' do
    let!(:movie1) { FactoryGirl.create(:movie, title: 'Jurassic Park', director: 'Speilberg') }
    let!(:movie2) { FactoryGirl.create(:movie, title: 'Jurassic Park 2', director: 'Speilberg') }
    let!(:movie3) { FactoryGirl.create(:movie, title: "Unknown", director: 'Someone') }
    let!(:movie4) { FactoryGirl.create(:movie, title: "NoOne") }

    context 'director exists' do
      it 'finds similar movies correctly' do
        expect(Movie.filter_by_director(movie1.director).pluck(:title)).to eql(['Jurassic Park', "Jurassic Park 2"])
        expect(Movie.filter_by_director(movie3.director).pluck(:title)).to eql(['Unknown'])
        expect(Movie.filter_by_director(movie1.director).pluck(:title)).to_not include(['Unknown'])
      end
    end

    context 'director does not exist' do
      it 'handles sad path' do
        expect(Movie.filter_by_director("")).to_not include(movie1)
      end
    end
  end

  describe '.all_ratings' do
    it 'returns all ratings' do
      expect(Movie.all_ratings).to match(%w(G PG PG-13 NC-17 R))
    end
  end
end