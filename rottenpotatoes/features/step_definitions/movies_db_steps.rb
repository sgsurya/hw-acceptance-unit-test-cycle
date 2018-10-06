Given("the following movies exist:") do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.hashes.each do |hash|
      Movie.create hash
  end
end

Then("the director of {string} should be {string}") do |string, string2|
  movie = Movie.find_by(title: string)
  visit movie_path(movie)
  expect(page.body).to match(/Director:\s#{string2}/)
end