FROM lambci/lambda:build-python3.7

COPY compile_and_deploy_lambda.sh .

RUN aws configure set output json

RUN pip install --upgrade awscli aws-sam-cli

CMD ["/bin/bash", "compile_and_deploy_lambda.sh"]