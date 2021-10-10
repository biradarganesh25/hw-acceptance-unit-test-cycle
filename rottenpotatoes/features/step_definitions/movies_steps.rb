
Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create movie
  end
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(page.body.index(e1) < page.body.index(e2))
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(', ').each do |rating|
    step %{I #{uncheck.nil? ? '' : 'un'}check "ratings_#{rating}"}
  end
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  Movie.all.each do |movie|
    step %{I should see "#{movie.title}"}
  end
end

Then /the director of "(.*)" should be "(.*)"/ do |movie, director|
  found  = false
  page.all(:xpath, '//table[@id="movies"]//tbody//tr').each do |tr|
    found = true
    if(movie == tr.all('td')[0].text)
      actual_director = tr.all('td')[3].text
      if director != actual_director
        fail "For movie #{movie}, director expected: #{director}, actual is: #{actual_director}"
      end
    end
  end

  if found == false
    fail "Could not find movie #{movie}"
  end
end