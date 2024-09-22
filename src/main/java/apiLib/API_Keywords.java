package apiLib;

import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Map;
import java.util.Properties;

public class API_Keywords {

    private static Properties properties = new Properties();

    public static void loadProperties(String env) {
        try {
            // Correct the path to load from src/main/resources/config
            FileInputStream fileInput = new FileInputStream("src/main/resources/config/" + env + ".properties");
            properties.load(fileInput);
        } catch (IOException e) {
            throw new RuntimeException("Could not load environment file: " + env, e);
        }
    }

    public static String getProperty(String key) {
        return properties.getProperty(key);
    }

    public static String loadTemplate(String filePath, Map<String, String> values) throws Exception {
        // Read the JSON template as a string
        String jsonTemplate = new String(Files.readAllBytes(Paths.get(filePath)));

        // Replace placeholders with actual values
        for (Map.Entry<String, String> entry : values.entrySet()) {
            jsonTemplate = jsonTemplate.replace("{{" + entry.getKey() + "}}", entry.getValue());
        }

        return jsonTemplate;
    }


}
