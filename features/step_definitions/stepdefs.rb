url = "https://petstore.swagger.io/v2/"
headers = {'Content-Type': 'application/json'}

Given /^send pet_id '(\d+)'$/ do |pet_id|
  @response = RestClient.get("#{url}pet/#{pet_id}", headers) {|response, request, result| response }
end

Then /^response status code equal '(\d+)'$/ do |status_code|
  expect(@response.code).to eq(status_code.to_i)
end