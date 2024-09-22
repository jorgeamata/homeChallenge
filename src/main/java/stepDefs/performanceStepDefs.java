package stepDefs;

import io.cucumber.java.Before;
import io.cucumber.java.en.Then;
import io.restassured.RestAssured;
import io.restassured.response.Response;
import org.apache.commons.lang.time.StopWatch;

import static apiLib.API_Keywords.getProperty;
import static apiLib.API_Keywords.loadProperties;
import static org.junit.Assert.assertTrue;

public class performanceStepDefs {

    private Response response;
    private long responseTime; // Store response time for performance testing

    @Before
    public void setUpPerformanceTest() {
        String env = System.getProperty("env", "dev"); // Default to 'dev' environment if not provided
        loadProperties(env);
        RestAssured.baseURI = getProperty("base.url");
        System.out.println("Base URL for performance: " + RestAssured.baseURI);
    }

    // Helper method for tracking GET request response time
    private Response sendPerformanceGETRequest(String endpoint) {
        StopWatch stopWatch = new StopWatch();
        stopWatch.start();

        response = RestAssured.given()
                .log().all()
                .get(endpoint)
                .then()
                .log().all()
                .extract()
                .response();

        stopWatch.stop();
        responseTime = stopWatch.getTime(); // Record the response time
        return response;
    }

    // Helper method for tracking POST request response time
    private Response sendPerformancePOSTRequest(String endpoint, String body) {
        StopWatch stopWatch = new StopWatch();
        stopWatch.start();

        response = RestAssured.given()
                .log().all()
                .header("Content-Type", "application/json")
                .body(body)
                .post(endpoint)
                .then()
                .log().all()
                .extract()
                .response();

        stopWatch.stop();
        responseTime = stopWatch.getTime(); // Record the response time
        return response;
    }

    @Then("the response time should be under {int} milliseconds")
    public void verifyResponseTime(int expectedTime) {
        System.out.println("Response time: " + responseTime + "ms");
        assertTrue("Response time exceeded threshold!", responseTime < expectedTime);
    }

}
