# Clicktripz Automation test

In a linux environment, clone this repository.

Change directory to test-robot-framework

Run the followning:

docker run \
    --shm-size=1g \
    -v \`pwd\`/reports:/opt/robotframework/reports:Z \
    -v \`pwd\`/test:/opt/robotframework/tests:Z \
    -e BROWSER=chrome \
    ppodgorsek/robot-framework:latest
