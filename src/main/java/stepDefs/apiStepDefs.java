package stepDefs;

import io.cucumber.java.Before;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.RestAssured;
import io.restassured.response.Response;
import java.util.HashMap;
import java.util.Map;
import static apiLib.API_Keywords.*;
import static org.junit.Assert.assertEquals;


public class apiStepDefs {

    private Response response;


    @Before
    public void setUpAPITest() {
        String env = System.getProperty("env", "dev"); // Default to 'dev' environment if not provided
        loadProperties(env);
        RestAssured.baseURI = getProperty("base.url");
        System.out.println("Base URL: " + RestAssured.baseURI); // Debug print
    }

    // Helper method for sending POST requests
    private Response sendPostRequest(String endpoint, String body) {
        return RestAssured.given()
                .log().all()
                .header("Content-Type", "application/json")
                .body(body)
                .post(endpoint)
                .then()
                .log().all()
                .extract()
                .response();
    }

    // Helper method for sending GET requests
    private Response sendGetRequest(String endpoint) {
        return RestAssured.given()
                .log().all()
                .get(endpoint)
                .then()
                .log().all()
                .extract()
                .response();
    }

    // Helper method for sending DELETE requests
    private Response sendDeleteRequest(String endpoint) {
        return RestAssured.given()
                .log().all()
                .delete(endpoint)
                .then()
                .log().all()
                .extract()
                .response();
    }

    // Helper method for sending GET requests with query parameters
    private Response sendGetRequestWithParams(String endpoint, Map<String, Object> queryParams) {
        return RestAssured.given()
                .log().all()
                .queryParams(queryParams)
                .get(endpoint)
                .then()
                .log().all()
                .extract()
                .response();
    }

    // Create pet with dynamic parameters
    @Given("I create a new pet with the following details: {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}")
    public void createPet(String petId, String petName, String categoryId, String categoryName, String photoUrl, String tagId, String tagName, String status) throws Exception {
        Map<String, String> values = new HashMap<>();
        values.put("petId", petId);
        values.put("petName", petName);
        values.put("categoryId", categoryId);
        values.put("categoryName", categoryName);
        values.put("photoUrl", photoUrl);
        values.put("tagId", tagId);
        values.put("tagName", tagName);
        values.put("status", status);

        String petJson = loadTemplate("/Users/jorgemata/personalProjects/homeChallenge/src/main/resources/payload_templates/pet.json", values);

        response = sendPostRequest("/pet", petJson); // Reuse the helper method
        response.then().statusCode(200);
    }

    // Retrieve pet by ID
    @When("I retrieve the pet with ID {string}")
    public void retrievePet(String petId) {
        String endpoint = String.format("/pet/%s", petId); // Create endpoint dynamically
        response = sendGetRequest(endpoint); // Reuse the helper method
    }

    // Verify status code
    @Then("the response should have status code {int}")
    public void verifyStatusCode(int expectedStatusCode) {
        response.then().statusCode(expectedStatusCode);
    }

    // Verify pet name
    @Then("the pet name should be {string}")
    public void verifyPetName(String expectedPetName) {
        String actualPetName = response.jsonPath().getString("name");
        assertEquals(expectedPetName, actualPetName);
    }

}
