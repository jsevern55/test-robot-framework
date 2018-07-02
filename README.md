# Clicktripz Automation test

1. In a linux environment, clone this repository.
    - `git clone https://github.com/jsevern55/test-robot-framework.git`
2. Change directory to ``test-robot-framework``
3. Run the followning:

``docker run --shm-size=1g -v `pwd`/reports:/opt/robotframework/reports:Z -v `pwd`/test:/opt/robotframework/tests:Z -e BROWSER=chrome ppodgorsek/robot-framework:latest``

Both test cases will execute consecutively.
Once the tests have finished, the logs and screenshots can be found in the reports directory (``test-robot-framework/reports``)
For a detailed report, open ``log.html``

For any questions, please contact jsevern55@outlook.com

# A brief explanation as to why I chose Robot Framework...

I chose Robot Framework for its simplicity, and easy set up. I have been using RF for a couple of years now within my current company. It is a scalable framework that can run on either Java or Python (I use Python). It has a community that supports the Built-In and SeleniumLibrary Libraries. Within the realm of Selenium automation, there is very little that I could not accomplish with RF out-of-box. Any functionality that was lacking in RF was easily added on the Python layer. RF could potentially be used by non-automation users with very litte training. Overall, I really enjoy the framework, and even contribute to it from time to time.

Thank you,

JR
