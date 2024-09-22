Feature: Demo API

  This feature file tests the creation and retrieval of pets in a demo API.
  It defines multiple scenarios to verify that the API correctly handles creating pets with various attributes and retrieving them by their ID.

  @api_Demo_01
  Scenario Outline: Create a pet with different attributes
    * I create a new pet with the following details: "<petId>", "<petName>", "<categoryId>", "<categoryName>", "<photoUrl>", "<tagId>", "<tagName>", "<status>"
    Examples:
      | petId | petName | categoryId | categoryName | photoUrl                      | tagId | tagName  | status    |
      | 101   | Fluffy  | 1          | Dogs         | http://example.com/fluffy.jpg | 1     | cute     | available |
      | 102   | Bella   | 1          | Dogs         | http://example.com/bella.jpg  | 2     | adorable | available |

  @api_Demo_02
  Scenario Outline: Retrieve a pet by ID
    When I create a new pet with the following details: "<petId>", "<petName>", "<categoryId>", "<categoryName>", "<photoUrl>", "<tagId>", "<tagName>", "<status>"
    And I retrieve the pet with ID "<petId>"
    Then the response should have status code 200
    And the pet name should be "<petName>"
    Examples:
      | petId | petName | categoryId | categoryName | photoUrl                      | tagId | tagName | status    |
      | 101   | Fluffy  | 1          | Dogs         | http://example.com/fluffy.jpg | 1     | cute    | available |

    #More scenarios that need to be covered for API:

  ######################## Pet API #######################

  #POST -- /pet
  Scenario: Create a pet without providing mandatory fields.
  Scenario: Create a pet with invalid data types for attributes (e.g., petId as a string).
  Scenario: Create a pet with a very large payload.
  Scenario: Create a duplicate pet (same petId).
  Scenario: Create a pet with special characters in pet name or status.

  #GET -- /pet/findByStatus

  Scenario: Retrieve pets by valid status (e.g., available, pending, sold).
  Scenario: Retrieve pets with an invalid status (e.g., non-existent status).
  Scenario: Retrieve pets without providing any status.

  #GET -- /pet/findByTags

  Scenario: Retrieve pets by valid tags (e.g., "cute", "large").
  Scenario: Retrieve pets with invalid or non-existent tags.
  Scenario: Retrieve pets when no tags are provided.

  #GET -- /pet/{petId}

  Scenario: Retrieve an existing pet by valid petId.
  Scenario: Retrieve a pet by an invalid petId (e.g., string instead of an integer).
  Scenario: Retrieve a pet with a petId that does not exist in the system.

  #POST -- /pet/{petId}

  Scenario: Update an existing pet's details with valid data.
  Scenario: Update a non-existent pet by providing an invalid petId.
  Scenario: Update a pet with incomplete/invalid data.

  #DELETE -- /pet/{petId}

  Scenario: Delete an existing pet by valid petId.
  Scenario: Attempt to delete a pet with an invalid or non-existent petId.

  #POST -- /pet/{petId}/uploadImage

  Scenario: Upload an image for a pet using a valid image file.
  Scenario: Upload an image for a non-existent petId.
  Scenario: Upload an invalid file format instead of an image (e.g., text file).


  ######################## Store API #######################

  #GET -- /store/inventory
  Scenario: Retrieve the inventory successfully.
  Scenario: Retrieve the inventory when no items exist in the store.

  #POST -- /store/order
  Scenario: Place a new order with valid details.
  Scenario: Place an order with missing required fields.
  Scenario: Place an order with invalid data types (e.g., invalid quantity).
  Scenario: Place multiple orders for the same item simultaneously.

  #GET -- /store/order/{orderId}
  Scenario: Retrieve an existing order by valid orderId.
  Scenario: Retrieve an order with an invalid orderId (e.g., non-numeric orderId).
  Scenario: Retrieve a non-existent order by orderId.

  #DELETE -- /store/order/{orderId}
  Scenario: Delete an existing order by valid orderId.
  Scenario: Attempt to delete an order that does not exist in the system.


  ######################## User API #######################
  #POST -- /user
  Scenario: Create a user with valid details.
  Scenario: Create a user with missing or invalid required fields (e.g., no username).
  Scenario: Create a user with a username that already exists.

  #POST -- /user/createWithList
  Scenario: Create multiple users at once with a valid user list.
  Scenario: Attempt to create users with a list containing invalid data (e.g., missing fields).

  #GET -- /user/login
  Scenario: Successfully log in a user with valid credentials.
  Scenario: Attempt to log in with invalid credentials (e.g., wrong username or password).
  Scenario: Attempt to log in with missing fields (e.g., no username provided).

  #GET -- /user/logout
  Scenario: Successfully log out a user.
  Scenario: Attempt to log out without being logged in.

  #GET -- /user/{username}
  Scenario: Retrieve an existing user by valid username.
  Scenario: Attempt to retrieve a user with a non-existent username.
  Scenario: Attempt to retrieve a user with invalid input (e.g., special characters in the username).

  #PUT -- /user/{username}
  Scenario: Update a user's information by valid username.
  Scenario: Attempt to update a user with missing or invalid data.
  Scenario: Attempt to update a non-existent user by username.

  #DELETE -- /user/{username}
  Scenario: Delete a user by valid username.
  Scenario: Attempt to delete a user with a non-existent username.
