   Assumptions made: 
       1. Hello World Node.js app made with Express web framework.
       2. Dockerized it using Dockerfile.
       3. Hosted the application over the GCP Cloud Run.

 This workflow build and push a Docker container to Google Artifact Registry and deploy it on Cloud Run when a commit is pushed to the "main" branch

 Overview:
 1. Authenticate to Google Cloud
 2. Authenticate Docker to Artifact Registry
 3. Build a docker container
 4. Publish it to Google Artifact Registry
 5. Deploy it to Cloud Run

To configure this CI/CD workflow:
 1. Ensure the required Google Cloud APIs are enabled:
 
    Cloud Run:run.googleapis.com

    Artifact Registry:artifactregistry.googleapis.com

 2. Create a Service Account and generate the JSON key for GCP Service account.
    2.a To create a Service account:
        Go to IAM -->Click on Service Account -->Click on create service account and enter the name.
    2.b To Generate Key for Service Account:
        Go to your Service Account --> Go to Keys tab --> Click on Add key -->Click on create new key -->Choose Key Format(JSON or P12).

 3. Ensure the required IAM permissions are granted
    Storage
       roles/storage.admin
    Cloud Run
      roles/run.admin
      roles/iam.serviceAccountUser     (to act as the Cloud Run runtime service account)

   Artifact Registry
      roles/artifactregistry.admin     (project or repository level)

   NOTE:Follow the principle of least privilege when assigning IAM roles to Service Account.
 4. Create GitHub secrets for GCP_CREDENTIALS and store your Service Account Key JSON value in it .

 5. Change the values for the GAR_LOCATION, SERVICE and REGION environment variables in the Workflows YAML file.

After you're done with your setup by following above steps. To Test the working of CI/CD Pipeline, make a code change and push to the main branch of the repository.