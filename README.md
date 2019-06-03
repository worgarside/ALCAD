# AWS Lambda Compilation And Deployment

This is a simple config/tool for compiling and deploying AWS Lambda functions in Python 3.7.

### Requirements and Dependencies

#### Project Dependencies
 
The only dependency for this project is Docker, the rest is taken care of by a custom Docker image!
 
#### Local File Requirements
 
- An envfile (`.env`) is needed to set the AWS credentials and Lambda function name. A sample file is provided to show what is needed. 
- A `requirements.txt` is also needed to set the Lambda functions dependencies.

### Installation and Use

Simply drop the `docker-compose.yml` file into your Lambda project (or your Python files into this project) and run `docker-compose up --build`.

This will create a local docker container, which is used to download the Python packages, zip the project into a deployment package and then deploy it to Lambda.

The deployment package zipfile is left in the working directory, whereas the directory with the Python packages is removed upon deployment.

### Docker Image Config

The directory `docker_image_config` holds two files: the `Dockerfile` used in creating the custom Docker image; and the bash script used in deploying the Lambda function. These are not used as part of the compilation and deployment process.
