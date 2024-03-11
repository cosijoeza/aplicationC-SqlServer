# Vectorstat Karate

Karate is the only open-source tool to combine API test-automation, mocks, performance-testing and even UI automation into a single, unified framework.\
You can find more information about this tool in: [Karate Labs](https://www.karatelabs.io/company) and
[Karate Official Repository](https://github.com/karatelabs/karate).

To run Karate we need to have installed Java and Maven.

### JDK Installation Guide
[Official documentation](https://docs.oracle.com/en/java/javase/21/install/index.html#Java-Platform%2C-Standard-Edition)

```
$java --version
openjdk 11.0.21
```
### Maven Installation Guide
[Official Documentation](https://maven.apache.org/download.cgi)
```
$mvn --version
Apache Maven 3.6.3

```
## Create New Project PROJECT-NAME

```bash
 mvn archetype:generate \
-DarchetypeGroupId=com.intuit.karate \
-DarchetypeArtifactId=karate-archetype \
-DarchetypeVersion=1.4.1 \
-DgroupId=GROUP-ID \
-DartifactId=PROJECT-NAME
```

Structure of the created project.
```
.
├── pom.xml
└── src
    └── test
        └── java
            ├── examples
            │   ├── ExamplesTest.java
            │   └── users
            │       ├── users.feature
            │       └── UsersRunner.java
            ├── karate-config.js
            └── logback-test.xml
```

## Usage
To start we need to create a new folder with a set of files in the next path:
**new-project/src/test/java/** for example the **ui** folder.
```
java
  └── ui
      ├── login
      │   ├── login.feature
      │   └── LoginRunner.java
      └── UiTest.java
```
## Files example

- login.feature
```feature
Feature: Vectorstat LOGIN

Background:
  * configure driver  = { type: 'chrome' }

Scenario: Open Vectorstat Login Page

  Given driver 'https://vectorint.vectorstat.com/en/login'
  Then match driver.url == 'https://vectorint.vectorstat.com/en/login'
```
- LoginRunner.java
```java
package ui.login;

import com.intuit.karate.junit5.Karate;

public class LoginRunner {
    @Karate.Test
    Karate testLogin() {
        return Karate.run("login").relativeTo(getClass());
    }
}
```
- UiTest.java
```java
package ui;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

public class UiTest {

    @Test
    void testParallel() {
        Results results = Runner.path("classpath:ui")
                .parallel(5);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}
```
To run this example
```
$mvn test -D=LoginRunner#testLogin
```

Results:
```javascript
[INFO] Tests run: 1, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 6.095 s - in ui.UiTest
[INFO]
[INFO] Results:
[INFO]
[INFO] Tests run: 2, Failures: 0, Errors: 0, Skipped: 0
[INFO]
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  14.908 s
[INFO] Finished at: 2024-02-22T21:26:54-06:00
[INFO] ------------------------------------------------------------------------
```
A new folder will be generated with the name **target**
You need to open the next path to see the report from a web browser.

```
PROJECT-NAME/target/karate-reports/karate-summary.html
```