class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  def self.filter_by_director(dir)
    Movie.where(director: dir)
  end
end
