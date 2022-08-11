dotenv() {
    set -a
    [ -f .env ] && . .env
    set +a
}

dotenv

# BUILD FRONTEND

cd ./frontend && npm run build && cd ..

# UPLOAD IMAGES TO DOCKER HUB

docker login -u $DOCKER_USER -p $DOCKER_PASSWORD

docker build . -t $DOCKER_USER/react-app:latest

docker push $DOCKER_USER/react-app:latest


# REGISTER TASK DEFINITION

aws ecs register-task-definition --cli-input-json file://task-definition.json
