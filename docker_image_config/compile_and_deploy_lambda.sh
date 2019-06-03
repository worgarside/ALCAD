#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"/app

DEPLOYMENT_PACKAGE="${DIR}/deployment_package.zip"
PACKAGES_DIR="./packages"

aws configure set aws_access_key_id ${AWS_ACCESS_KEY}
aws configure set aws_secret_access_key ${AWS_SECRET_KEY}
aws configure set region ${AWS_REGION}

cd "${DIR}"

mkdir "${PACKAGES_DIR}"
cd "${PACKAGES_DIR}"
pip install -r "${DIR}/requirements.txt" --upgrade --target .
echo "Packages downloaded"

zip -r9 "${DEPLOYMENT_PACKAGE}" . >> /dev/null 2>&1
echo "Zipped packages"

cd ..

zip -g "${DEPLOYMENT_PACKAGE}" *.py
echo "Added modules to deployment package"

FILESIZE="$((`du -k "$DEPLOYMENT_PACKAGE" | cut -f1` / 1024))"
echo "Deployment package is ${FILESIZE}MB"

aws lambda update-function-code --function-name ${LAMBDA_FUNCTION} --zip-file "fileb://${DEPLOYMENT_PACKAGE}"
echo "Deployment successful!"

echo "Cleaning up..."

rm -r "${PACKAGES_DIR}"
echo "Bye!"
