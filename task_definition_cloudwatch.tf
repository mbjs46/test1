[
  {
    "essential": true,
    "image": "${ecr_image_url}",
    "name": "${name}",
    "portMappings": [
      {
        "containerPort": ${port},
        "hostPort": ${port}
      }
    ],
    "logConfiguration": {
      "logDriver" : "awslogs",
      "options" : {
        "awslogs-region" : "${region}",
        "awslogs-group" : "${name}",
        "awslogs-stream-prefix" : "${prefix_logs}"
      }
    },
    "environment": ${environment}
  }
]
