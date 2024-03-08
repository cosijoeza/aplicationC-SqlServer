Feature: Vectorstat LOGIN

Background:
  * configure driver  = { type: 'chrome' }
  * def       seconds = 10000

Scenario: Login with a SysAdmin user.
* def email = 'testsysadmin@datyra.com'
* def password = '9512224499'
Given driver 'https://vectorint.vectorstat.com/en/login'
* delay(seconds)
And input('#email', email)
And input('#password', password)
When click("//*[@id='root']/div/div/div/form/button")
* delay(seconds)
Then match driver.url == 'https://vectorint.vectorstat.com/'

Scenario: Login with a Field Service Rep user.
* def email = 'testservicerep@datyra.com'
* def password = 'password'
Given driver 'https://vectorint.vectorstat.com/en/login'
* delay(seconds)
And input('#email', email)
And input('#password', password)
When click("//*[@id='root']/div/div/div/form/button")
* delay(seconds)
Then match driver.url == 'https://vectorint.vectorstat.com/'

Scenario: Login with a TestEOL user.
* def email = 'testeol@datyra.com'
* def password = 'x'
Given driver 'https://vectorint.vectorstat.com/en/login'
* delay(seconds)
And input('#email', email)
And input('#password', password)
When click("//*[@id='root']/div/div/div/form/button")
* delay(seconds)
Then match driver.url == 'https://vectorint.vectorstat.com/'

Scenario: Login with a Engineering user.
* def email = 'testengineer@datyra.com'
* def password = '.'
Given driver 'https://vectorint.vectorstat.com/en/login'
* delay(seconds)
And input('#email', email)
And input('#password', password)
When click("//*[@id='root']/div/div/div/form/button")
* delay(seconds)
Then match driver.url == 'https://vectorint.vectorstat.com/'

Scenario: Login with a Custumer Admin user.
* def email = 'testcustumeradmin@datyra.com'
* def password = '{}'
Given driver 'https://vectorint.vectorstat.com/en/login'
* delay(seconds)
And input('#email', email)
And input('#password', password)
When click("//*[@id='root']/div/div/div/form/button")
* delay(seconds)
Then match driver.url == 'https://vectorint.vectorstat.com/'