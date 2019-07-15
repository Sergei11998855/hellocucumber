Feature: Test /v2/pet handler

  Scenario: Test  /v2/pet handler
    Given send valid post request with pet_id '1' and 'valid_pet_name'
    Then response status code equal '200'
    And pet_id equal '1'
    And pet_name equal 'valid_pet_name'
