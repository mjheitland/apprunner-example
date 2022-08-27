# Deploy simple web server with AWS App Runner

## bash

1. Export AWS profile
2. Run ./create-and-push-docker-image.sh

## AWS Console

3. Create role "accessECR"

```JSON
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "ecr:*",
            "Resource": "*"
        }
    ]
}
```

4. Deploy in App Runner with role "accessECR", ECR Docker image URL, port 3000
