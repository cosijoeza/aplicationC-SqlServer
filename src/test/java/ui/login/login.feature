Feature: TEST LOGIN SECTION (ID: LOG)

Background:
  * configure driver  = { type: 'chrome' }
  * def       seconds = 10000
  * def       credentials = [{email:'testsysadmin@datyra.com', password:'9512224499'}, {email:'testservicerep@datyra.com',password:'password'}, {email:'testeol@datyra.com',password:'x'},{email:'testengineer@datyra.com',password:'.'},{email:'testcustumeradmin@datyra.com',password:'{}'}]

# ===============TEST-ID:LOG-1===============
# Log in and check if we get to the main menu.

Scenario: Login with a SysAdmin user.
Given driver 'https://vectorint.vectorstat.com/en/login'
* delay(seconds)
And input('#email', credentials[0].email)
And input('#password', credentials[0].password)
When click("//*[@id='root']/div/div/div/form/button")
* delay(seconds)
Then match driver.url == 'https://vectorint.vectorstat.com/'

Scenario: Login with a Field Service Rep user.
Given driver 'https://vectorint.vectorstat.com/en/login'
* delay(seconds)
And input('#email', credentials[1].email)
And input('#password', credentials[1].password)
When click("//*[@id='root']/div/div/div/form/button")
* delay(seconds)
Then match driver.url == 'https://vectorint.vectorstat.com/'

Scenario: Login with a TestEOL user.
Given driver 'https://vectorint.vectorstat.com/en/login'
* delay(seconds)
And input('#email', credentials[2].email)
And input('#password', credentials[2].password)
When click("//*[@id='root']/div/div/div/form/button")
* delay(seconds)
Then match driver.url == 'https://vectorint.vectorstat.com/'

Scenario: Login with a Engineering user.
Given driver 'https://vectorint.vectorstat.com/en/login'
* delay(seconds)
And input('#email', credentials[3].email)
And input('#password', credentials[3].password)
When click("//*[@id='root']/div/div/div/form/button")
* delay(seconds)
Then match driver.url == 'https://vectorint.vectorstat.com/'

Scenario: Login with a Custumer Admin user.
Given driver 'https://vectorint.vectorstat.com/en/login'
* delay(seconds)
And input('#email', credentials[4].email)
And input('#password', credentials[4].password)
When click("//*[@id='root']/div/div/div/form/button")
* delay(seconds)
Then match driver.url == 'https://vectorint.vectorstat.com/'