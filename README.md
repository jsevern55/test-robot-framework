# Clicktripz Automation test

1. In a linux environment, clone this repository.
    - `git clone https://github.com/jsevern55/test-robot-framework.git`
2. Change directory to test-robot-framework
3. Run the followning:

``docker run --shm-size=1g -v `pwd`/reports:/opt/robotframework/reports:Z -v `pwd`/test:/opt/robotframework/tests:Z -e BROWSER=chrome ppodgorsek/robot-framework:latest``
