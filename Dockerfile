# Use an official Python runtime as a parent image
FROM python:3.9

# Set the working directory to /bank_system
WORKDIR /bank_system

# Clone the repository into the container
#RUN git clone https://github.com/sandeep7757/bank_system.git

# install the SQL DB
RUN apt-get update && \
    apt-get install -y sqlite3 libsqlite3-dev
# Copy the application files into the container
COPY . .

# Set the default command to run the Python application
CMD ["python", "app.py"]

# Create a virtual environment and activate it
RUN python3 -m venv venv
RUN . venv/bin/activate

# Install any needed packages specified in requirements.txt
RUN pip3 install --no-cache-dir -r ./requirements.txt

# Set the working directory to the cloned repository
WORKDIR /bank_system

# Run the Django development server
CMD python3 manage.py runserver 0:8000
