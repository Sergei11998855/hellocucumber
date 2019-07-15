Feature: Test /GetPet handler

  Scenario Outline: Get pet info with pet id
    Given send pet_id '<pet_id>'
    Then response status code equal '<status_code>'

    Examples:
      | pet_id  | status_code |
      | 1       | 200         |
      | 9999999 | 404         |
