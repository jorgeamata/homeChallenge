Feature: Performance Testing for Pet API Endpoints
  To ensure that the API responds within acceptable limits for critical operations.
  The performance tests will validate that response times for key endpoints are below defined thresholds.

  @performance_Demo_01
  Scenario: Verify response time for retrieving a pet by ID
    When I retrieve the pet with ID "101"
    Then the response time should be under 2000 milliseconds

  @performance_Demo_02
  Scenario: Verify response time for creating a new pet
    Given I create a new pet with the following details: "123", "Bella", "1", "Dogs", "http://example.com/photo.jpg", "2", "cute", "available"
    Then the response time should be under 3000 milliseconds

    #More scenarios that need to be covered for PERFORMANCE:

  ######################## Pet API #######################

  #POST -- /pet
  Scenario: Measure response time when creating a single pet with valid data.
  Scenario: Test with a large number of concurrent requests to create multiple pets.
  Scenario: Stress test by increasing the number of requests gradually until the API starts failing.
  Scenario: Load test by sending a continuous stream of pet creation requests for a prolonged period.

  #GET -- /pet/findByStatus
  Scenario: Measure the response time for retrieving pets by status under normal load.
  Scenario: Load test with multiple concurrent requests using different statuses.
  Scenario: Stress test the API by sending an excessive number of requests.

  #GET -- /pet/findByTags
  Scenario: Measure performance when retrieving pets by valid tags.
  Scenario: Load test with a large set of requests using different tags concurrently.
  Scenario: Stress test by overloading the API with requests for rare or common tags.

  #GET -- /pet/{petId}
  Scenario: Measure response time for retrieving a single pet by its ID.
  Scenario: Test concurrency by sending requests for different pet IDs simultaneously.
  Scenario: Stress test by retrieving pets that do not exist to evaluate error-handling under load.

  #POST -- /pet/{petId}
  Scenario: Measure response time for updating a pet’s details.
  Scenario: Load test by updating many pets concurrently.
  Scenario: Stress test by sending excessive update requests to push the API to its limits.

  #DELETE -- /pet/{petId}
  Scenario: Measure the time taken to delete a pet with valid petId.
  Scenario: Load test with multiple pet deletion requests simultaneously.
  Scenario: Stress test by attempting to delete many non-existent pets concurrently.

  #POST -- /pet/{petId}/uploadImage
  Scenario: Measure response time for uploading a valid image.
  Scenario: Load test by uploading images for different pets simultaneously.
  Scenario: Stress test with very large images or a high volume of image uploads.

    ######################## Store API #######################
  #GET -- /store/inventory
  Scenario: Measure response time when retrieving the store inventory.
  Scenario: Load test by continuously querying the inventory with concurrent users.
  Scenario: Stress test with a large number of requests to see at what point the API breaks.

  #POST -- /store/order
  Scenario: Measure response time when placing an order.
  Scenario: Load test by placing many orders concurrently.
  Scenario: Stress test by continuously placing orders with increasing load.

  #GET -- /store/order/{orderId}
  Scenario: Measure response time when retrieving an order by its ID.
  Scenario: Load test with multiple requests for different order IDs concurrently.
  Scenario: Stress test by querying non-existent order IDs and increasing load.

  #DELETE -- /store/order/{orderId}
  Scenario: Measure the performance when deleting an order by ID.
  Scenario: Load test by sending multiple delete requests for different orders.
  Scenario: Stress test with multiple requests for orders that do not exist.

    ######################## User API #######################

  #POST -- /user
  Scenario: Measure response time for creating a new user.
  Scenario: Load test by creating multiple users simultaneously.
  Scenario: Stress test by continuously sending user creation requests with increasing load.

  #POST -- /user/createWithList
  Scenario: Measure response time for bulk user creation.
  Scenario: Load test by submitting large lists of users concurrently.
  Scenario: Stress test with excessively large user lists.

  #GET -- /user/login
  Scenario: Measure login response time for a valid user.
  Scenario: Load test by simulating concurrent login requests.
  Scenario: Stress test with a high volume of login requests.

  #GET -- /user/logout
  Scenario: Measure response time for logging out a user.
  Scenario: Load test by simulating many users logging out simultaneously.
  Scenario: Stress test by sending a high number of logout requests from multiple users.

  #GET -- /user/{username}
  Scenario: Measure the time taken to retrieve a user by username.
  Scenario: Load test by retrieving multiple users concurrently.
  Scenario: Stress test by sending multiple requests for non-existent users.

  #PUT -- /user/{username}
  Scenario: Measure response time for updating a user's details.
  Scenario: Load test by sending multiple update requests for different users.
  Scenario: Stress test by sending excessive updates for non-existent users.

  #DELETE -- /user/{username}
  Scenario: Measure response time when deleting a user.
  Scenario: Load test by deleting multiple users simultaneously.
  Scenario: Stress test by attempting to delete non-existent users with increasing load.
