python3 -V
tar -xf google-cloud-cli-darwin-x86_64.tar.gz
tar -xf google-cloud-cli-darwin-x86_64
ls
cd
gcloud auth list
gcloud config list
terrasync-images-arpita-92731
gsutil mb gs://terrasync-images-...
gsutil cp sample.jpg gs://terrasync-images-...
gsutil lifecycle set lifecycle.json gs://...
gcloud compute disks create db-us-data-disk ...
gcloud compute instances attach-disk db-us ...
gcloud compute ssh db-us --tunnel-through-iap
BUCKET=terrasync-images-arpita-92731
gsutil mb -l US gs://$BUCKET
echo "sample" > sample.jpg
gsutil cp sample.jpg gs://$BUCKET/
gsutil ls gs://$BUCKET
cat > lifecycle.json <<'EOF'
{
  "rule": [
    {
      "action": { "type": "SetStorageClass", "storageClass": "NEARLINE" },
      "condition": { "age": 90 }
    }
  ]
}
EOF

gsutil lifecycle set lifecycle.json gs://$BUCKET
gsutil lifecycle get gs://$BUCKET
gcloud compute disks create db-us-data-disk   --size=20GB   --type=pd-ssd   --zone=us-central1-c
gcloud compute instances attach-disk db-us   --disk=db-us-data-disk   --zone=us-central1-c
gcloud compute ssh db-us --zone us-central1-c --tunnel-through-iap
gcloud compute ssh web-us --zone us-central1-c
gcloud compute ssh db-us --zone us-central1-c --tunnel-through-iap
gcloud compute ssh web-us --zone us-central1-c
nc -zv <DB-US-INTERNAL-IP> 5432
gcloud compute ssh web-us --zone us-central1-c
arpitavingodbole@cloudshell:~ (cs446-vm1)$
gsutil ls
gsutil lifecycle get gs://<EXACT-BUCKET-NAME>
gsutil lifecycle get gs://terrasync-images-arpita-92731
gcloud compute networks subnets create subnet-eu-public   --network=terrasync-vpc   --region=europe-west1   --range=10.20.1.0/24
gcloud compute instances get-serial-port-output web-eu --zone=europe-west1-b --port=1 | tail -n 200
gcloud compute instances delete web-eu --zone=europe-west1-b
gcloud compute instances create web-eu   --zone=europe-west1-b   --subnet=subnet-eu-public   --tags=web-server   --image-family=ubuntu-2204-lts   --image-project=ubuntu-os-cloud   --metadata=startup-script='#!/bin/bash
set -eux
apt-get update -y
apt-get install -y nginx
echo "Hello from TerraSync Europe!" > /var/www/html/index.html
systemctl enable --now nginx'
gcloud compute instances delete web-eu   --zone=europe-west1-b
y
gcloud compute instances create web-eu   --zone=europe-west1-b   --subnet=subnet-eu-public   --tags=web-server   --machine-type=e2-micro   --image-family=ubuntu-2204-lts   --image-project=ubuntu-os-cloud   --metadata=startup-script='#!/bin/bash
set -eux
apt-get update -y
apt-get install -y nginx
echo "Hello from TerraSync Europe!" > /var/www/html/index.html
systemctl enable nginx
systemctl restart nginx'
gcloud compute ssh web-us --zone us-central1-c
gcloud services enable cloudfunctions.googleapis.com   vision.googleapis.com   firestore.googleapis.com   eventarc.googleapis.com   cloudbuild.googleapis.com   run.googleapis.com
gcloud storage buckets create gs://riskpredictionsystem-image-pipeline   --location=us-central1
mkdir ~/image-pipeline && cd ~/image-pipeline
nano main.py
gcloud functions deploy process-image   --gen2   --runtime=python311   --region=us-central1   --source=.   --entry-point=process_image   --trigger-event-filters="type=google.cloud.storage.object.v1.finalized"   --trigger-event-filters="bucket=YOUR_PROJECT_ID-image-pipeline"   --service-account=YOUR_PROJECT_NUMBER-compute@developer.gserviceaccount.com
nano requirements.txt
nano main.py
gcloud functions deploy process-image   --gen2   --runtime=python311   --region=us-central1   --source=.   --entry-point=process_image   --trigger-event-filters="type=google.cloud.storage.object.v1.finalized"   --trigger-event-filters="bucket=YOUR_PROJECT_ID-image-pipeline"   --service-account=YOUR_PROJECT_NUMBER-compute@developer.gserviceaccount.com
gcloud functions deploy process-image   --gen2   --runtime=python311   --region=us-central1   --source=.   --entry-point=process_image   --trigger-event-filters="type=google.cloud.storage.object.v1.finalized"   --trigger-event-filters="bucket=YOUR_PROJECT_ID-image-pipeline"   --service-account=871013170557-compute@developer.gserviceaccount.com
clear
quit
exit
gcloud services enable cloudfunctions.googleapis.com   vision.googleapis.com   firestore.googleapis.com   eventarc.googleapis.com   cloudbuild.googleapis.com   run.googleapis.com
gcloud storage buckets create gs://week9-491219-image-pipeline \
gcloud storage buckets create gs://week9-491219-image-pipeline \--location=us-central1
gcloud storage buckets create gs://week9-491219-image-pipeline \ --location=us-central1
clear
mkdir ~/image-pipeline && cd ~/image-pipeline
why bri
cd ~/image-pipeline
nano main.py
ls
gcloud functions deploy process-image   --gen2   --runtime=python311   --region=us-central1   --source=.   --entry-point=process_image   --trigger-event-filters="type=google.cloud.storage.object.v1.finalized"   --trigger-event-filters="bucket=YOUR_PROJECT_ID-image-pipeline"   --service-account=YOUR_PROJECT_NUMBER-compute@developer.gserviceaccount.com
gcloud functions deploy process-image \
gcloud projects describe YOUR_PROJECT_ID --format="value(projectNumber)"
gcloud projects describe week9-491219 --format="value(projectNumber)"
-
gcloud functions deploy process-image   --gen2   --runtime=python311   --region=us-central1   --source=.   --entry-point=process_image   --trigger-event-filters="type=google.cloud.storage.object.v1.finalized"   --trigger-event-filters="bucket=week9-491219-image-pipeline"   --service-account=903582864029-compute@developer.gserviceaccount.com
gcloud projects add-iam-policy-binding week9-491219   --member=serviceAccount:903582864029-compute@developer.gserviceaccount.com   --role=roles/cloudbuild.builds.builder
gcloud functions deploy process-image   --gen2   --runtime=python311   --region=us   --source=.   --entry-point=process_image   --trigger-event-filters="type=google.cloud.storage.object.v1.finalized"   --trigger-event-filters="bucket=week9-491219-image-pipeline"   --service-account=903582864029-compute@developer.gserviceaccount.com
gcloud storage rm -r gs://week9-491219-image-pipeline
gcloud storage buckets create gs://week9-491219-image-pipeline   --location=us-central1
gcloud functions deploy process-image   --gen2   --runtime=python311   --region=us-central1   --source=.   --entry-point=process_image   --trigger-event-filters="type=google.cloud.storage.object.v1.finalized"   --trigger-event-filters="bucket=week9-491219-image-pipeline"   --service-account=903582864029-compute@developer.gserviceaccount.com
gcloud projects add-iam-policy-binding week9-491219   --member=serviceAccount:903582864029-compute@developer.gserviceaccount.com   --role=roles/eventarc.eventReceiver
gcloud projects add-iam-policy-binding week9-491219   --member=serviceAccount:903582864029-compute@developer.gserviceaccount.com   --role=roles/run.invoker
gcloud functions deploy process-image   --gen2   --runtime=python311   --region=us-central1   --source=.   --entry-point=process_image   --trigger-event-filters="type=google.cloud.storage.object.v1.finalized"   --trigger-event-filters="bucket=week9-491219-image-pipeline"   --service-account=903582864029-compute@developer.gserviceaccount.com
nano main.py
gcloud functions deploy process-image   --gen2   --runtime=python311   --region=us-central1   --source=.   --entry-point=process_image   --trigger-event-filters="type=google.cloud.storage.object.v1.finalized"   --trigger-event-filters="bucket=week9-491219-image-pipeline"   --service-account=903582864029-compute@developer.gserviceaccount.com
SERVICE_AGENT=$(gsutil kms serviceaccount -p week9-491219)
echo $SERVICE_AGENT
gcloud functions deploy process-image   --gen2   --runtime=python311   --region=us-central1   --source=.   --entry-point=process_image   --trigger-event-filters="type=google.cloud.storage.object.v1.finalized"   --trigger-event-filters="bucket=week9-491219-image-pipeline"   --service-account=903582864029-compute@developer.gserviceaccount.com
gcloud projects add-iam-policy-binding week9-491219   --member=serviceAccount:$SERVICE_AGENT   --role=roles/pubsub.publisher
gcloud functions deploy process-image   --gen2   --runtime=python311   --region=us-central1   --source=.   --entry-point=process_image   --trigger-event-filters="type=google.cloud.storage.object.v1.finalized"   --trigger-event-filters="bucket=week9-491219-image-pipeline"   --service-account=903582864029-compute@developer.gserviceaccount.com
gcloud storage cp ~/pic.jpg gs://week9-491219-image-pipeline/
gcloud functions logs read process-image --region=us-central1 --limit=20
gcloud firestore databases list
gcloud storage cp ~/pic.jpg gs://week9-491219-image-pipeline/
gcloud functions logs read process-image --region=us-central1 --limit=20
nano main.py
gcloud functions deploy process-image   --gen2   --runtime=python311   --region=us-central1   --source=.   --entry-point=process_image   --trigger-event-filters="type=google.cloud.storage.object.v1.finalized"   --trigger-event-filters="bucket=week9-491219-image-pipeline"   --service-account=903582864029-compute@developer.gserviceaccount.com
cd ..
gcloud storage cp ~/pic.jpg gs://week9-491219-image-pipeline/
gcloud functions logs read process-image --region=us-central1 --limit=20
clear
gcloud functions logs read process-image --region=us-central1 --limit=20
ls
cd image-pipeline
nano main.py
gcloud functions deploy process-image   --gen2   --runtime=python311   --region=us-central1   --source=.   --entry-point=process_image   --trigger-event-filters="type=google.cloud.storage.object.v1.finalized"   --trigger-event-filters="bucket=week9-491219-image-pipeline"   --service-account=903582864029-compute@developer.gserviceaccount.com
gcloud firestore databases list
nano main.py
gcloud functions deploy process-image   --gen2   --runtime=python311   --region=us-central1   --source=.   --entry-point=process_image   --trigger-event-filters="type=google.cloud.storage.object.v1.finalized"   --trigger-event-filters="bucket=week9-491219-image-pipeline"   --service-account=903582864029-compute@developer.gserviceaccount.com
gcloud storage cp ~/pic.jpg gs://week9-491219-image-pipeline/
gcloud functions logs read process-image --region=us-central1 --limit=20
gcloud storage cp ~/pic.jpg gs://week9-491219-image-pipeline/pic.jpg
gcloud functions logs read process-image --region=us-central1 --limit=10
cat ~/image-pipeline/main.py | grep "database"
cd ..
cat > ~/image-pipeline/main.py << 'EOF'
import functions_framework
from google.cloud import vision, firestore

db = firestore.Client(project="week9-491219", database="db-1")
vision_client = vision.ImageAnnotatorClient()

@functions_framework.cloud_event
def process_image(cloud_event):
    data = cloud_event.data
    bucket = data["bucket"]
    name = data["name"]

    if not name.lower().endswith(('.jpg', '.jpeg', '.png', '.gif', '.bmp')):
        print(f"Skipping non-image file: {name}")
        return

    image = vision.Image(source=vision.ImageSource(
        gcs_image_uri=f"gs://{bucket}/{name}"
    ))
    response = vision_client.document_text_detection(image=image)
    text = response.full_text_annotation.text if response.full_text_annotation else ""

    db.collection("image_analysis_results").add({
        "fileName": name,
        "extractedText": text,
        "processedAt": firestore.SERVER_TIMESTAMP,
        "characterCount": len(text)
    })
    print(f"Processed {name}: extracted {len(text)} characters")
EOF

cd image-pipeline
gcloud functions deploy process-image   --gen2   --runtime=python311   --region=us-central1   --source=.   --entry-point=process_image   --trigger-event-filters="type=google.cloud.storage.object.v1.finalized"   --trigger-event-filters="bucket=week9-491219-image-pipeline"   --service-account=903582864029-compute@developer.gserviceaccount.com
gcloud storage cp ~/pic.jpg gs://week9-491219-image-pipeline/pic.jpg
gcloud functions logs read process-image --region=us-central1 --limit=10
cat > ~/image-pipeline/main.py << 'EOF'
import functions_framework
from google.cloud import vision, firestore

db = firestore.Client(project="week9-491219", database="db-1")
vision_client = vision.ImageAnnotatorClient()

@functions_framework.cloud_event
def process_image(cloud_event):
    data = cloud_event.data
    bucket = data["bucket"]
    name = data["name"]

    if not name.lower().endswith(('.jpg', '.jpeg', '.png', '.gif', '.bmp')):
        print(f"Skipping non-image file: {name}")
        return

    image = vision.Image(source=vision.ImageSource(
        gcs_image_uri=f"gs://{bucket}/{name}"
    ))
    response = vision_client.document_text_detection(image=image)
    text = response.full_text_annotation.text if response.full_text_annotation else ""

    db.collection("image_analysis_results").add({
        "fileName": name,
        "extractedText": text,
        "processedAt": firestore.SERVER_TIMESTAMP,
        "characterCount": len(text)
    })
    print(f"Processed {name}: extracted {len(text)} characters")
EOF

nano main.py
gcloud functions delete process-image --region=us-central1 --gen2
cat ~/image-pipeline/main.py
cd ~/image-pipeline && gcloud functions deploy process-image   --gen2   --runtime=python311   --region=us-central1   --source=.   --entry-point=process_image   --trigger-event-filters="type=google.cloud.storage.object.v1.finalized"   --trigger-event-filters="bucket=week9-491219-image-pipeline"   --service-account=903582864029-compute@developer.gserviceaccount.com
gcloud storage cp ~/pic.jpg gs://week9-491219-image-pipeline/pic3.jpg
gcloud functions logs read process-image --region=us-central1 --limit=10
cat ~/image-pipeline/main.py
gcloud functions describe process-image --region=us-central1 --gen2
gcloud storage cp ~/pic.jpg gs://week9-491219-image-pipeline/testfinal.jpg
gcloud functions logs read process-image --region=us-central1 --limit=5
gcloud projects add-iam-policy-binding week9-491219   --member=serviceAccount:903582864029-compute@developer.gserviceaccount.com   --role=roles/datastore.user
gcloud auth login
gcloud storage cp ~/pic.jpg gs://week9-491219-image-pipeline/pic4.jpg
gcloud functions logs read process-image --region=us-central1 --limit=5
gcloud projects add-iam-policy-binding week9-491219   --member=serviceAccount:903582864029-compute@developer.gserviceaccount.com   --role=roles/editor
gcloud storage cp ~/pic.jpg gs://week9-491219-image-pipeline/pic6.jpg
gcloud functions logs read process-image --region=us-central1 --limit=5
gcloud storage cp ~/pic.jpg gs://week9-491219-image-pipeline/pic6.jpg
gcloud functions logs read process-image --region=us-central1 --limit=5
gcloud projects add-iam-policy-binding week9-491219   --member=serviceAccount:903582864029-compute@developer.gserviceaccount.com   --role=roles/datastore.user
gcloud projects add-iam-policy-binding week9-491219   --member=serviceAccount:903582864029-compute@developer.gserviceaccount.com   --role=roles/firebase.admin
gcloud projects add-iam-policy-binding week9-491219   --member=serviceAccount:903582864029-compute@developer.gserviceaccount.com   --role=roles/cloudplatform.viewer
gcloud projects add-iam-policy-binding week9-491219   --member=serviceAccount:903582864029-compute@developer.gserviceaccount.com   --role=roles/editor
gcloud storage cp ~/pic.jpg gs://week9-491219-image-pipeline/pic7.jpg
gcloud functions logs read process-image --region=us-central1 --limit=5
gcloud projects add-iam-policy-binding week9-491219   --member=serviceAccount:903582864029-compute@developer.gserviceaccount.com   --role=roles/editor
gcloud storage cp ~/pic.jpg gs://week9-491219-image-pipeline/pic8.jpg
gcloud functions logs read process-image --region=us-central1 --limit=5
gcloud projects add-iam-policy-binding week9-491219   --member=serviceAccount:903582864029-compute@developer.gserviceaccount.com   --role=roles/datastore.owner
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
