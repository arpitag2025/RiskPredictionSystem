gcloud storage cp ~/pic.jpg gs://week9-491219-image-pipeline/pic9.jpg
gcloud functions logs read process-image --region=us-central1 --limit=5
gcloud storage cp ~/pic2.jpg gs://week9-491219-image-pipeline/pic10.jpg
ls
cd image-pipeline
gcloud storage cp ~/pic3.jpg gs://week9-491219-image-pipeline/pic11.jpg
nano main.py
gcloud config set project week10-492604
gcloud services enable language.googleapis.com
gcloud config set project week9-491219
gcloud services enable language.googleapis.com
pip install google-cloud-language
from google.cloud import language_v2
client = language_v2.LanguageServiceClient()
text = "The movie was amazing and I loved it!"
document = language_v2.Document(
)
response = client.analyze_sentiment(request={"document": document})
print("Score:", response.document_sentiment.score)
print("Magnitude:", response.document_sentiment.magnitude)
clear
nano sentiment_test.py
python sentiment_test.py
nano sentiment_test.py
python sentiment_test.py
nano main.py
gcloud functions deploy analyze_text   --runtime python311   --trigger-bucket YOUR_BUCKET_NAME   --entry-point analyze_text
gsutil ls
gcloud functions deploy analyze_text   --runtime python311   --trigger-bucket week9-491219-image-pipeline   --entry-point analyze_text
nano requirements.txt
ls
gcloud functions deploy analyze_text   --runtime python311   --trigger-bucket week9-491219-image-pipeline   --entry-point analyze_text
gsutil cp *.txt gs://week9-491219-image-pipeline
gsutil cp text1.txt gs://week9-491219-image-pipeline
ls
mv text1 text1.txt
mv text2 text2.txt
mv text3 text3.txt
mv text5 text5.txt
mv text6 text6.txt
gsutil cp *.txt gs://week9-491219-image-pipeline
gcloud functions deploy analyze_text   --gen2   --runtime python311   --region=us-central1   --source=.   --entry-point analyze_text   --trigger-event-filters="type=google.cloud.storage.object.v1.finalized"   --trigger-event-filters="bucket=week9-491219-image-pipeline"
gsutil cp text1.txt gs://week9-491219-image-pipeline
from google.cloud import storage
nano main.py
gcloud functions deploy analyze_text   --gen2   --runtime python311   --region=us-central1   --source=.   --entry-point analyze_text   --trigger-event-filters="type=google.cloud.storage.object.v1.finalized"   --trigger-event-filters="bucket=week9-491219-image-pipeline"
echo "This movie was incredible and exciting" > test_final.txt
gsutil cp test_final.txt gs://week9-491219-image-pipeline
gcloud functions delete analyze_text --region=us-central1
gcloud functions deploy analyze_text   --gen2   --runtime python311   --region=us-central1   --source=.   --entry-point analyze_text   --trigger-event-filters="type=google.cloud.storage.object.v1.finalized"   --trigger-event-filters="bucket=week9-491219-image-pipeline"
echo "Netflix produced a great movie that I enjoyed a lot" > trigger_test.txt
gsutil cp trigger_test.txt gs://week9-491219-image-pipeline
gcloud functions delete analyze_text --region=us-central1
gcloud functions deploy analyze_text   --gen2   --runtime python311   --region=us-central1   --source=.   --entry-point analyze_text   --trigger-event-filters="type=google.cloud.storage.object.v1.finalized"   --trigger-event-filters="bucket=week9-491219-image-pipeline"
gcloud functions deploy analyze_text   --gen2   --runtime python311   --region=us-central1   --source=.   --entry-point analyze_text   --trigger-event-filters="type=google.cloud.storage.object.v1.finalized"   --trigger-event-filters="bucket=week9-491219-image-pipeline"
gcloud functions deploy analyze-text   --gen2   --runtime python311   --region=us-central1   --source=.   --entry-point analyze_text   --trigger-event-filters="type=google.cloud.storage.object.v1.finalized"   --trigger-event-filters="bucket=week9-491219-image-pipeline"
gcloud functions deploy analyze-text-v2   --gen2   --runtime python311   --region=us-central1   --source=.   --entry-point analyze_text   --trigger-event-filters="type=google.cloud.storage.object.v1.finalized"   --trigger-event-filters="bucket=week9-491219-image-pipeline"
echo "This movie was amazing and exciting" > finaltest2.txt
gsutil cp finaltest2.txt gs://week9-491219-image-pipeline
clear
nano main.py
gcloud functions deploy final-nlp   --gen2   --runtime python311   --region=us-central1   --source=.   --entry-point analyze_text   --trigger-event-filters="type=google.cloud.storage.object.v1.finalized"   --trigger-event-filters="bucket=week9-491219-image-pipeline"
echo "This movie was amazing and I loved it" > FINAL.txt
gsutil cp FINAL.txt gs://week9-491219-image-pipeline
nano test_firestore.py
python test_firestore.py
pip install google-cloud-firestore
python test_firestore.py
nano test_firestore.py
python test_firestore.py
gsutil cp text1.txt gs://week9-491219-image-pipeline
gsutil cp *.txt gs://week9-491219-image-pipeline
gcloud iam service-accounts create data-processor-sa
roles/storage.objectViewer
gcloud projects add-iam-policy-binding PROJECT_ID   --member="serviceAccount:data-processor-sa@PROJECT_ID.iam.gserviceaccount.com"   --role="roles/cloudsql.client"
clear
gcloud projects add-iam-policy-binding week9-491219    --member="serviceAccount:data-processor-sa@week9-491219.iam.gserviceaccount.com"   --role="roles/cloudsql.client"
gcloud storage buckets list
clear
gcloud storage cp file.txt gs://my-bucket/
ls
gcloud storage buckets list
gcloud storage buckets add-iam-policy-binding gs://week9-491219-image-pipeline   --member="serviceAccount:data-processor-sa@PROJECT_ID.iam.gserviceaccount.com"   --role="roles/storage.objectViewer"
gcloud storage buckets add-iam-policy-binding gs://week9-491219-image-pipeline   --member="serviceAccount:data-processor-sa@week9-491219iam.gserviceaccount.com"   --role="roles/storage.objectViewer"
gcloud iam service-accounts create data-processor-sa
gcloud storage buckets add-iam-policy-binding gs://week9-491219-image-pipeline   --member="serviceAccount:data-processor-sa@week9-491219iam.gserviceaccount.com"   --role="roles/storage.objectViewer"
gcloud storage buckets add-iam-policy-binding gs://week9-491219-image-pipeline   --member="serviceAccount:data-processor-sa@week9-491219.iam.gserviceaccount.com"   --role="roles/storage.objectViewer"
--condition='expression=resource.name.startsWith("projects/_/buckets/BUCKET/objects/uploads/")'
roles/storage.objectCreator
gcloud iam service-accounts create data-processor-sa
roles/storage.objectCreator
--role="roles/storage.objectCreator"
gcloud storage buckets add-iam-policy-binding gs://YOUR_BUCKET   --member="serviceAccount:YOUR_SA@PROJECT_ID.iam.gserviceaccount.com"   --role="roles/storage.objectCreator"
gcloud storage buckets list
zgcloud storage buckets add-iam-policy-binding gs://week9-491219-image-pipeline   --member="serviceAccount:YOUR_UPLOADER_SA@week9-491219.iam.gserviceaccount.com"   --role="roles/storage.objectCreator"
gcloud storage buckets add-iam-policy-binding gs://week9-491219-image-pipeline   --member="serviceAccount:YOUR_UPLOADER_SA@week9-491219.iam.gserviceaccount.com"   --role="roles/storage.objectCreator"
gcloud iam service-accounts create uploader-sa
gcloud storage buckets add-iam-policy-binding gs://week9-491219-image-pipeline   --member="serviceAccount:uploader-sa@week9-491219.iam.gserviceaccount.com"   --role="roles/storage.objectCreator"
gcloud storage buckets add-iam-policy-binding gs://week9-491219-image-pipeline   --member="serviceAccount:processor-sa@week9-491219.iam.gserviceaccount.com"   --role="projects/week9-491219/roles/objectProcessor"
clear
gcloud iam service-accounts keys create key.json   --iam-account=ml-reader-sa@week9-491219.iam.gserviceaccount.com
gcloud iam service-accounts create ml-reader-sa
gcloud iam service-accounts keys create key.json   --iam-account=ml-reader-sa@week9-491219.iam.gserviceaccount.com
gcloud storage buckets add-iam-policy-binding gs://week9-491219-image-pipeline   --member="serviceAccount:ml-reader-sa@week9-491219.iam.gserviceaccount.com"   --role="roles/storage.objectViewer"
gcloud iam service-accounts add-iam-policy-binding   ml-reader-sa@week9-491219.iam.gserviceaccount.com   --member="user:arpitavingodbole@gmail.com"   --role="roles/iam.serviceAccountTokenCreator"
gcloud iam service-accounts add-iam-policy-binding   ml-reader-sa@week9-491219.iam.gserviceaccount.com   --member="user:arpitavingodbole@gmail.com"   --role="roles/iam.serviceAccountTokenCreator"
gcloud auth print-access-token   --impersonate-service-account=ml-reader-sa@week9-491219.iam.gserviceaccount.com
gcloud iam service-accounts add-iam-policy-binding   ml-reader-sa@week9-491219.iam.gserviceaccount.com   --member="user:arpitavingodbole@gmail.com"   --role="roles/iam.serviceAccountTokenCreator"
gcloud iam service-accounts get-iam-policy   ml-reader-sa@week9-491219.iam.gserviceaccount.com
gcloud auth print-access-token   --impersonate-service-account=ml-reader-sa@week9-491219.iam.gserviceaccount.com
mkdir terraform-lab
cd terraform-lab
nano main.tf
nano variables.tf
nano outputs.tf
terraform init
cd terraform-lab
terraform plan
terraform force-unlock a1790d1b-1ae0-1bb6-e415-728827303791
rm -f terraform.tfstate.lock.info
terraform plan
rm -rf .terraform
rm -f terraform.tfstate*
terraform init
terraform plan
terraform apply
gcloud services enable compute.googleapis.com
terraform apply
terraform destroy
nano app.py
pip install flask google-cloud-bigquery
python app.py
nano app.py
python app.py
nano app.py
python app.py
nano app.py
python app.py
nano app.py
python app.py
nano app.py
python app.py
nano app.py
python app.py
ls
python3 app.py
ls
nano pic3.jpg
rm pic3.jpg
cd terraform-lab
ls
cd ..
nano main.py
cd
ls
rm main.py
rm sample.jpg
rm text3.txt
rm text5.jpg
rm text5.text
rm text5.txt
ls
rm test_final.py
rm test_final.txt
rm test_firestore.py
ls
rm text1.txt
rm text2.txt
rm pic2.jpg
rm pic.jpg
rm finaltest2.txt
rm FINAL.txt
clear
ls
rm trigger_test.txt
clear
python3 app.py
nano app.py
python3 app.py
nano app.py
python3 app.py
mkdir templates
cd templates
nano index.html
cd ..
ls
rm text6.txt
nano app.py
python3 app.py
mkdir static
nano static/styles.css
cd templates
rm index.html
nano index.html
cd..
cd ..
python3 app.py
nano app.py
python3 app.py
grep -n "LIMIT" app.py
python3 app.py
nano app.py
python3 app.py
nano app.py
python3 app.py
nano app.py
python3 app.py
nano app.py
python3 app.py
,
cd riskpredictionsystem
terraform version
sudo apt-get update
sudo apt-get install -y terraform
mkdir terraform
cd terraform
ls
cd ..
ls
rm terraform-lab
cd terraform
nano main.tf
terraform init
terraform plan
terraform apply
nano main.tf
rm main.tf
nano main.tf
terraform init
nano main.tf
terraform init
terraform plan
terraform apply
nano main.tf
clear
terraform init
terraform plan
terraform apply
cd riskpredictionsystem
git init
git add .
git commit -m "Checkpoint 2 progress: API, UI, Terraform"
git remote add origin https://github.com/arpitag2025/RiskPredictionSystem.git
git branch -M main
git push -u origin main
git config --global user.name “arpitag2025”
git config --global user.email “arpitagodbole29.com"
'









git config --global user.name “arpitag2025”
git config --global user.email “arpitagodbole29@gmail.com"
git config --global user.email "arpitagodbole29@gmail.com"
git config --global --list
git add .
git commit -m "Initial commit"
git branch -M main
git push -u origin main
clear
git push -u origin main
git credential reject https://github.com
git push -u origin main
git remote remove origin
git remote add origin https://github.com/arpitag2025/RiskPredictionSystem.git
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/arpitag2025/RiskPredictionSystem.git
git push -u origin main
du -ah . | sort -rh | head -20
git rm -r --cached terraform/.terraform
git rm -r --cached terraform-lab/.terraform
git rm -r --cached .cache
nano .gitignore
git add .
git commit -m "Remove terraform binaries and cache"
rm -rf .git
git init
git add .
git commit -m "clean repo"
git branch -M main
git remote add origin https://github.com/arpitag2025/RiskPredictionSystem.git
git push -u origin main
python3 app.py
clear
ls
python3 app.py
ls
cd image-pipelin
cd image-pipeline
ls
nano main.py
cd ..
rm  image-pipeline
rmdir image-pipeline
cd image-pipeline
rm main.py
rm requirements.txt
cd ..
rmdir image-pipeline
clear
ls
cd terraform-lab
ls
rm variables.tf
rm terraform.tfstate.backuo
rm terraform.tfstate.backup
terraform.tfstate
rm terraform.tfstate
ls
rm outputs.tf
rm main.tf
cd ..
rm terraform-lab
rmdir terraform-lab
clear
cd terraform-lab
ls
cd ..
ls 
nano app.py
nano sentiment_test.py
rm sentiment_test.py
nano app.py
clear
cat app.py
cd ..
nano app.py
nANO.APPY
nano app.py
clear
gcloud config set project week14-495417
nano app.py
pwd
ls
mkdir week14-lab
cd week14-lab
pwd
touch app.py Dockerfile requirements.txt cloudbuild.yaml
nano app.py
nano requirements.txt
nano Dockerfile 
nano cloudbuild.yaml
gcloud services enable cloudbuild.googleapis.com run.googleapis.com artifactregistry.googleapis.com
clear
cd ..
ls
rm week14-lab
rmdir week14-lab
cd week14-lab
rm Dockerfile
ls
rm requirements.txt
rm cloudbuild.yaml
rm app.py
cd ..
rmdir week14-lab
gcloud config set project week9-491219
ls
cd week9lab
cd terraform-lab
ls
cd ..
mkdir week9
cd week9
clear
gcloud config set project week9-491219
mkdir week14-lab
cd week14-lab
touch app.py Dockerfile requirements.txt cloudbuild.yaml
nano app.py
nano Dockerfile
nano requirements.txt
nano cloudbuild.yaml
gcloud services enable cloudbuild.googleapis.com run.googleapis.com artifactregistry.googleapis.com
PROJECT_NUMBER=$(gcloud projects describe $PROJECT_ID --format='value(projectNumber)')
SA=${PROJECT_NUMBER}-compute@developer.gserviceaccount.com
gcloud projects add-iam-policy-binding $PROJECT_ID   --member="serviceAccount:$SA" --role="roles/run.admin"
gcloud projects add-iam-policy-binding $PROJECT_ID   --member="serviceAccount:$SA" --role="roles/iam.serviceAccountUser"
gcloud projects add-iam-policy-binding $PROJECT_ID   --member="serviceAccount:$SA" --role="roles/artifactregistry.writer"
clear
903582864029=$(gcloud projects describe $week9-491219 --format='value(projectNumber)')
SA=${903582864029}-compute@developer.gserviceaccount.com
gcloud projects add-iam-policy-binding $week9-491219   --member="serviceAccount:$SA" --role="roles/run.admin"
gcloud projects add-iam-policy-binding $week9-491219   --member="serviceAccount:$SA" --role="roles/iam.serviceAccountUser"
gcloud projects add-iam-policy-binding $week9-491219   --member="serviceAccount:$SA" --role="roles/artifactregistry.writer"
PROJECT_ID=week9-491219
PROJECT_NUMBER=$(gcloud projects describe $PROJECT_ID --format='value(projectNumber)')
SA=${PROJECT_NUMBER}-compute@developer.gserviceaccount.com
echo $PROJECT_ID
echo $PROJECT_NUMBER
echo $SA
gcloud projects add-iam-policy-binding $PROJECT_ID   --member="serviceAccount:$SA"   --role="roles/run.admin"
gcloud projects add-iam-policy-binding $PROJECT_ID   --member="serviceAccount:$SA"   --role="roles/iam.serviceAccountUser"
gcloud projects add-iam-policy-binding $PROJECT_ID   --member="serviceAccount:$SA"   --role="roles/artifactregistry.writer"
gcloud artifacts repositories create labs   --repository-format=docker   --location=us-central1
gcloud builds submit --config cloudbuild.yaml .
gcloud auth configure-docker us-central1-docker.pkg.dev
gcloud builds submit --config cloudbuild.yaml .
cat cloudbuild.yaml
cat Dockerfile
cat requirements.txt
cat app.py
gcloud builds log ee3a859e-39bc-4347-ab99-605a34453c25
nano app.py
gcloud builds submit --config cloudbuild.yaml .
ls
cd week14-lab
gcloud builds submit --config cloudbuild.yaml .
gcloud config set project week9-491219
gcloud builds submit --config cloudbuild.yaml .
gcloud builds log 61e48b9d-8d35-417a-a245-957f16ee726c
gcloud config get-value project
gcloud artifacts repositories list --location=us-central1
cat cloudbuild.yaml
cat > cloudbuild.yaml <<'EOF'
steps:
  - name: 'python:3.12-slim'
    entrypoint: 'bash'
    args: ['-c', 'pip install -r requirements.txt && pip install pytest && pytest -q || true']

  - name: 'gcr.io/cloud-builders/docker'
    args: ['build','-t',
           'us-central1-docker.pkg.dev/week9-491219/labs/ship-it:latest', '.']

  - name: 'gcr.io/cloud-builders/docker'
    args: ['push',
           'us-central1-docker.pkg.dev/week9-491219/labs/ship-it:latest']

  - name: 'gcr.io/google.com/cloudsdktool/cloud-sdk'
    entrypoint: 'gcloud'
    args: ['run','deploy','ship-it',
           '--image','us-central1-docker.pkg.dev/week9-491219/labs/ship-it:latest',
           '--region','us-central1',
           '--allow-unauthenticated']

options:
  logging: CLOUD_LOGGING_ONLY
EOF

nano cloudbuild.yaml
gcloud builds submit --config cloudbuild.yaml .
URL=$(gcloud run services describe ship-it \
  --region us-central1 \
  --format='value(status.url)')
echo $URL
curl $URL
curl $URL/guess/42
curl $URL/guess/75
echo $URL
curl $URL
curl $URL/guess/42
gcloud run services delete ship-it --region us-central1 --quiet
gcloud artifacts repositories delete labs --location us-central1 --quiet
gcloud config set project riskpredictionsystem
ls
cat app.py
nano app.py
pip install numpy scikit-learn
python app.py
ls
cd templates
nano index.html
cat index.html
nano index.html
cd ..
python app.py
cd templates 
rm index.html
nano index.html
cd ..
python app.py
gcloud config set project
gcloud config set project riskpredictionsystem
gcloud auth application-default login
gcloud config set project riskpredictionsystem
python app.py
nano requirements.txt
nano Dockerfile
docker build -t healthcare-risk-app .
docker run -p 8080:8080 healthcare-risk-app
ls
cd templates
nano index.html
cd ..
python app.py
clear
python app.py
ls
python app.py
ls
nano Dockerfile
nano deployment.yaml
python app.py
clear
python app.py
clear
nano app.py
nano requirements.txt
git status
