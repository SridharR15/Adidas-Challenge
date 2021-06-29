Feature: Products
 
    Background:
        * url productbaseUrl    
    Scenario: Get All Products
	    Given path '/product'
	    When method GET
	    Then status 200
	    And print response
	    * def productId = "FI444"
			* def out = karate.jsonPath(response, "$[?(@.id == '" + productId + "')]")
			And match out[0].price == 94
			And match out[0].description == "description"
			And match out[0].imgUrl == "https://assets.adidas.com/images/w_320,h_320,f_auto,q_auto:sensitive,fl_lossy/6634cf36274b4ea5ac46ac4e00b2021e_9366/Superstar_Shoes_Black_FY0071_01_standard.jpg"
			* def productId = "HI347"
			* def out = karate.jsonPath(response, "$[?(@.id == '" + productId + "')]")
			And match out[0].price == 82
			And match out[0].description == "description"
			And match out[0].imgUrl == "https://assets.adidas.com/images/w_320,h_320,f_auto,q_auto:sensitive,fl_lossy/6634cf36274b4ea5ac46ac4e00b2021e_9366/Superstar_Shoes_Black_FY0071_01_standard.jpg"
		Scenario: Get a Product
	    Given path '/product'
	    And path 'FI444'
	    When method GET
	    Then status 200
	    And print response
			And match response.price == 94
			And match response.description == "description"
			And match response.imgUrl == "https://assets.adidas.com/images/w_320,h_320,f_auto,q_auto:sensitive,fl_lossy/6634cf36274b4ea5ac46ac4e00b2021e_9366/Superstar_Shoes_Black_FY0071_01_standard.jpg"
		Scenario: Post a Product
			* def jsonBody =
			 """
			{
			  "id": "FIKarate",
			  "name": "KaratePost",
			  "description": "A product for Karate framwork",
			  "imgUrl": "https://assets.adidas.com/images/w_320,h_320,f_auto,q_auto:sensitive,fl_lossy/6634cf36274b4ea5ac46ac4e00b2021e_9366/karate.jpg"
			}
			 """
	    Given path '/product'
	    And request jsonBody
	    When method POST
	    Then status 200
	    And print response
	    And match response.id == "FIKarate"
	    And match response.name == "KaratePost"
			And match response.description == "A product for Karate framwork"
			And match response.imgUrl == "https://assets.adidas.com/images/w_320,h_320,f_auto,q_auto:sensitive,fl_lossy/6634cf36274b4ea5ac46ac4e00b2021e_9366/karate.jpg"
			And match response._id != null
		Scenario: Put a Product
			* def jsonBody =
			 """
			{
			  "id": "FIKarate",
			  "name": "RugbyBall",
			  "description":"Ball",
			  "imgUrl": "https://assets.adidas.com/images/w_320,h_320,f_auto,q_auto:sensitive,fl_lossy/6634cf36274b4ea5ac46ac4e00b2021e_9366/karate.jpg"
			}
			 """
	    Given path '/product'
	    And request jsonBody
	    And path 'FIKarate'
	    When method PUT
	    Then status 200
	    And print response
	    And match response.id == "FIKarate"
	    And match response.name == "KaratePut"
			And match response.description == "A product for Karate framwork"
			And match response.imgUrl == "https://assets.adidas.com/images/w_320,h_320,f_auto,q_auto:sensitive,fl_lossy/6634cf36274b4ea5ac46ac4e00b2021e_9366/karate.jpg"
		Scenario: Delete a Product
	    Given path '/product'
	    And path 'FIKarate'
	    When method DELETE
	    Then status 200
	    And print response
	    
	  # Negative Scenarios
	  Scenario: Get a Product with Invalid Product ID
	    Given path '/product'
	    And path 'FI000'
	    When method GET
	    Then status 500
	    And print response
		Scenario: Post a Product with missing id
			* def jsonBody =
			 """
			{
			  "name": "KaratePost",
			  "description": "A product for Karate framwork",
			  "imgUrl": "https://assets.adidas.com/images/w_320,h_320,f_auto,q_auto:sensitive,fl_lossy/6634cf36274b4ea5ac46ac4e00b2021e_9366/karate.jpg"
			}
			 """
	    Given path '/product'
	    And request jsonBody
	    When method POST
	    Then status 400
	    And print response
	  Scenario: Post a Product with missing name
			* def jsonBody =
			 """
			{
			  "id": "FIKarate",
			  "description": "A product for Karate framwork",
			  "imgUrl": "https://assets.adidas.com/images/w_320,h_320,f_auto,q_auto:sensitive,fl_lossy/6634cf36274b4ea5ac46ac4e00b2021e_9366/karate.jpg"
			}
			 """
	    Given path '/product'
	    And request jsonBody
	    When method POST
	    Then status 400
	    And print response
	  Scenario: Post a Product with missing description
			* def jsonBody =
			 """
			{
			  "id": "FIKarate",
			  "name": "KaratePost",
			  "imgUrl": "https://assets.adidas.com/images/w_320,h_320,f_auto,q_auto:sensitive,fl_lossy/6634cf36274b4ea5ac46ac4e00b2021e_9366/karate.jpg"
			}
			 """
	    Given path '/product'
	    And request jsonBody
	    When method POST
	    Then status 400
	    And print response
		Scenario: Post a Product with missing image URL
			* def jsonBody =
			 """
			{
			  "id": "FIKarate",
			  "name": "KaratePost",
			  "description": "A product for Karate framwork"
			}
			 """
	    Given path '/product'
	    And request jsonBody
	    When method POST
	    Then status 400
	    And print response
		Scenario: Post a Product with missing body
			* def jsonBody =
			 """
			{}
			 """
	    Given path '/product'
	    And request jsonBody
	    When method POST
	    Then status 400
	    And print response
		Scenario: Put a Product with missing id
			* def jsonBody =
			 """
			{
			  "name": "KaratePut",
			  "description": "A product for Karate framwork",
			  "imgUrl": "https://assets.adidas.com/images/w_320,h_320,f_auto,q_auto:sensitive,fl_lossy/6634cf36274b4ea5ac46ac4e00b2021e_9366/karate.jpg"
			}
			 """
	    Given path '/product'
	    And request jsonBody
	    And path 'FIKarate'
	    When method PUT
	    Then status 400
	    And print response
		Scenario: Put a Product with missing name
			* def jsonBody =
			 """
			{
			  "id": "FIKarate",
			  "description": "A product for Karate framwork",
			  "imgUrl": "https://assets.adidas.com/images/w_320,h_320,f_auto,q_auto:sensitive,fl_lossy/6634cf36274b4ea5ac46ac4e00b2021e_9366/karate.jpg"
			}
			 """
	    Given path '/product'
	    And request jsonBody
	    And path 'FIKarate'
	    When method PUT
	    Then status 400
	    And print response
		Scenario: Put a Product with missing description
			* def jsonBody =
			 """
			{
			  "id": "FIKarate",
			  "name": "KaratePut",
			  "imgUrl": "https://assets.adidas.com/images/w_320,h_320,f_auto,q_auto:sensitive,fl_lossy/6634cf36274b4ea5ac46ac4e00b2021e_9366/karate.jpg"
			}
			 """
	    Given path '/product'
	    And request jsonBody
	    And path 'FIKarate'
	    When method PUT
	    Then status 400
	    And print response
		Scenario: Put a Product with missing image URL
			* def jsonBody =
			 """
			{
			  "id": "FIKarate",
			  "name": "KaratePut",
			  "description": "A product for Karate framwork"
			}
			 """
	    Given path '/product'
	    And request jsonBody
	    And path 'FIKarate'
	    When method PUT
	    Then status 400
	    And print response
		Scenario: Put a Product with missing body
			* def jsonBody =
			 """
			{}
			 """
	    Given path '/product'
	    And request jsonBody
	    And path 'FIKarate'
	    When method PUT
	    Then status 400
	    And print response
		Scenario: Delete a Product with Invalid Id
	    Given path '/product'
	    And path 'DeleteInvalidId'
	    When method DELETE
	    Then status 400
	    And print response