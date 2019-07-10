module FridayStepHelper
  def is_it_friday(day)
    if day == 'Friday'
      'TGIF'
    else
      'Nope'
    end
  end
end

World FridayStepHelper

Given("today is {string}") do |given_day|
  @today = given_day
end

When("I ask whether it's Friday yet") do
  @actual_answer = is_it_friday(@today)
end

Then("I should be told {string}") do |expected_answer|
  expect(@actual_answer).to eq(expected_answer)
end


# require 'rest-client'
#
# def test_method
#   url = 'https://petstore.swagger.io/v2/pet/1'
#   headers = {'Content-Type': 'application/json'}
#   test = RestClient.get(url, headers)
#   print test
# end
# test_method