# Setting Up a Docker Environment and Deploying a Containerized Application on AWS EC2 Using Terraform

### Objective:
As a DevOps Engineer, your task is to set up a Docker environment on an AWS EC2 instance
using Terraform and deploy a containerized application using Docker CLI.
You will create a basic Terraform configuration file that provisions an EC2 instance,
installs Docker, and configures the instance for remote SSH access.
Then, you will complete the Docker Networking and Container Deployment exercise on the EC2 instance.

### Requirements:

#### Part 1: AWS EC2 Instance Setup with Docker (50 points)

1. Create an AWS EC2 instance using Terraform with the following specifications:
    - Use Amazon Linux 2 as the base AMI.
    - Accept the instance type as a variable (default to t2.micro)
    - Use variables as much as you can.

1. Use a ```userdata.sh``` script to set up the Docker environment on the EC2 instance:
    - Install Docker and Docker Compose.
    - Start and enable the Docker service.
    - Add the ```ec2-user``` to the Docker group.
    - Install ```alpine```, ```mysql:5.6``` and ```kodekloud/simple-webapp-mysql``` images.

1. Configure the security group to allow SSH access from any IP address (0.0.0.0/0) and allow TCP traffic on port 38080 from any source IP address.

1. Provide the public IP address of the instance as an output.

#### Part 2: Hands-On Docker Networking and Container Deployment (50 points)

1. Follow the instructions provided in the "Hands-On Docker Networking and Container Deployment" exercise on the EC2 instance:

    - List and inspect Docker networks.
    - Run the `alpine-2` container using the `none` network.
    - Create the `wp-mysql-network` network. Use `bridge` network, allocate subnet 182.18.0.1/24 and configure gateway 182.18.0.1
    - Deploy a MySQL container named `mysql-db` on the `wp-mysql-network` network. Set the database password to use `db_pass123`. The environment variable to set is `MYSQL_ROOT_PASSWORD`.
    - Deploy a web application container named `webapp` on the `wp-mysql-network` network.
        The webapp service:
        - Use command line to build the image for the webapp.
        - Deploy a web application named `webapp` using the `kodekloud/simple-webapp-mysql` image.
        - Map port 38080 on the Docker host to port 8080 in the container.
        - Set the `DB_Host` with the value `mysql-db` and `DB_Password` with `db_pass123` environment variables for the web app.
        - Attach `wp-mysql-network` network to the webapp container.
        - Link `mysql-db` to newly creating webapp container.
    -Test the application by accessing it and its database by using the public IP address of the EC2 instance.
1. After completing the exercise, clean up the containers and networks.

### Deliverables:

The `main.tf` file with the Terraform configuration.
The `variables.tf` file with variable definitions.
The `outputs.tf` file with defined outputs.
The `userdata.sh` file with necessary commands.
A screenshot of the newly created `webapp` on browser.

### Evaluation Criteria:

The Terraform configuration file should be well-structured and easy to understand.
The EC2 instance should be created successfully with the specified settings.
The Docker environment should be set up correctly on the EC2 instance.
The security group should be configured to allow SSH and 38080 access.
The "Container Deployment" exercise should be completed successfully, with screenshot.
