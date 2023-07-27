# get our Python image
FROM python:3.11.4

# create and move to the /app directory
# all commands after will execute in this directory
WORKDIR /app

# copy our local src folder to /app in the container
COPY ./src/ /app
COPY ./conf/entrypoint.sh /app/entrypoint.sh

# Run os-level updates
RUN apt-get update && \
    apt-get install -y python3-venv python3-dev python3-pip

# Create our Python virtual environment
RUN python3 -m venv /opt/venv

# Update the virtual environment pip
RUN /opt/venv/bin/python -m pip install --upgrade pip

# Install our project dependencies
RUN /opt/venv/bin/python -m pip install -r requirements.txt

RUN chmod +x ./entrypoint.sh
# Run a server to expose copied files
CMD ["./entrypoint.sh"]