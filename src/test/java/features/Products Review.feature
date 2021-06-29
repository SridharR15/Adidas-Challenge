Feature: Products Review
 
    Background:
        * url productreviewbaseUrl
    Scenario: Post a Review
			* def jsonBody =
			 """
			{
			  "productId": "FI444",
			  "locale": "",
			  "rating": 5,
			  "text": "Karate Testing Review"
			}
			 """
	    Given path '/reviews'
	    And path 'FIKarate'
	    And request jsonBody
	    When method POST
	    Then status 201
	    And print response
	    And match response.productId == "FIKarate"
			And match response.locale == ""
			And match response.rating == 5
			And match response.text == "Karate Testing Review"
		Scenario: Get a Review
	    Given path '/reviews'
	    And path 'FIKarate'
	    When method GET
	    Then status 200
	    And print response
			And match response[0].productId == "FIKarate"
			And match response[0].rating == 5
			And match response[0].text == "Karate Testing Review"
		Scenario: Post a Invalid Review
			* def jsonBody =
			 """
			{}
			 """
	    Given path '/reviews'
	    And path 'InvalidID'
	    And request jsonBody
	    When method POST
	    Then status 201
	    And print response
	    And match response.productId == "InvalidID"
		Scenario: Get a Review with Invalid ID
	    Given path '/reviews'
	    And path 'InvalidKarateID'
	    When method GET
	    Then status 200
	    And print response
			And assert response.length == 0