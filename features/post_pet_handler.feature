Feature: Test /v2/pet handler

  Scenario: Test valid request
    Given send post request with pet_id: '1' and name: 'valid_pet_name'
    Then response status code equal '200'
    And pet_id equal '1'
    And pet_name equal 'valid_pet_name'

  Scenario: Test request without pet name
    Given send post request with pet_id: '2' and without pet_name
    Then response status code equal '400'

  Scenario: Test request with invalid pet_id
    Given send post request with pet_id: 'invalid_pet_id' and name: 'valid_pet_name'
    Then response status code equal '500'

  Scenario: Test request with invalid pet_status
    Given send request with invalid pet_status: 'invalid_status_value'
    Then response status code equal '400'



