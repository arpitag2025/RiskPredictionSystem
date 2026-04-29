from google.cloud import language_v2

client = language_v2.LanguageServiceClient()

text = "The movie was amazing and I loved it!"

document = language_v2.Document(
    content=text,
    type_=language_v2.Document.Type.PLAIN_TEXT
)

response = client.analyze_sentiment(request={"document": document})

print("Score:", response.document_sentiment.score)
print("Magnitude:", response.document_sentiment.magnitude)

entities = client.analyze_entities(request={"document": document})

for entity in entities.entities:
    print(entity.name, entity.type_.name)
