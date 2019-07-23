require_relative '../handlers/post_pet_handler'

url = "https://petstore.swagger.io/v2/"
headers = {'Content-Type': 'application/json', 'accept': 'application/json'}

Given /^send pet_id '(\d+)'$/ do |pet_id|
  @response = RestClient.get("#{url}pet/#{pet_id}", headers) {|response, request, result| response }
end

Given /^send post request with pet_id: '(.*)' and name: '([^'|'$]*)'?/ do |pet_id, pet_name|
  request = PostPet.request_with_id_and_name(pet_id, pet_name)
  @response = RestClient.post("#{url}pet", request, headers) {|response, request, result| response }
end

Given /^send post request with pet_id: '(.*)' and without pet_name?/ do |pet_id|
  request = {
      "id": pet_id,
      "category": {
          "id": 0,
          "name": "string"
      },
      "name": nil,
      "photoUrls": [
          "string"
      ],
      "tags": [
          {
              "id": 0,
              "name": "string"
          }
      ],
      "status": "available"
  }
  @response = RestClient.post("#{url}pet", request.to_json, headers) {|response, request, result| response }
end

Then /^response status code equal '(\d+)'$/ do |status_code|
  expect(@response.code).to eq(status_code.to_i)
end

And /^pet_id equal '(\d+)'$/ do |pet_id|
  expect(JSON.parse(@response)['id']).to eq(pet_id)
end

And /^pet_name equal '([^'|'$]*)'$/ do |pet_name|
  expect(JSON.parse(@response)["name"]).to eq(pet_name)
end


Given(/^send request with invalid pet_status: '([^'|'$]*)'$/) do |pet_status|
  request = {
      "id": 3,
      "category": {
          "id": 3,
          "name": "string"
      },
      "name": nil,
      "photoUrls": [
          "string"
      ],
      "tags": [
          {
              "id": 0,
              "name": "string"
          }
      ],
      "status": "pet_status"
  }
  @response = RestClient.post("#{url}pet", request.to_json, headers) {|response, request, result| response }
end