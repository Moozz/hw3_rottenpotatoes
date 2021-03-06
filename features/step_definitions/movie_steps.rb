# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie) if !Movie.exists?(movie)
  end
end

# Make sure that one string (regexp) occurs before or after another one
# on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  assert false, "Unimplmemented"
end

Then /I should see all the movies/ do
  with_scope("movies") do
    #page.
  end
  Movie.count
  assert false, "Unimplmemented"
end

Then /I should not see all the movies/ do
  assert false, "Unimplmemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list = rating_list.split ","
  rating_list.split do |x|
    step %Q{I #{uncheck}check "ratings_#{x.strip}"}
  end
end
