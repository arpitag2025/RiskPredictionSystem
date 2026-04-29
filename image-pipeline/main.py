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
