url = "https://petstore.swagger.io/v2/"
headers = {'Content-Type': 'application/json', 'accept': 'application/json'}

Given /^send pet_id '(\d+)'$/ do |pet_id|
  @response = RestClient.get("#{url}pet/#{pet_id}", headers) {|response, request, result| response }
end

Given /^send valid post request with pet_id '(\d+)' and '(\w+)'?/ do |pet_id, pet_name|
  request = {
      "id": pet_id,
      "category": {
          "id": 0,
          "name": "string"
      },
      "name": pet_name,
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


And /^pet_name equal '(\w+)'$/ do |pet_name|
  expect(JSON.parse(@response)["name"]).to eq(pet_name)
end