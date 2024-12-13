import boto3
import os

def upload_to_s3(bucket_name, file_path, object_name=None):
    s3_client = boto3.client('s3')
    
    if object_name is None:
        object_name = os.path.basename(file_path)

    try:
        s3_client.upload_file(file_path, bucket_name, object_name)
        print(f"File {file_path} uploaded to {bucket_name}/{object_name}")
    except Exception as e:
        print(f"Error uploading file: {e}")

if __name__ == "__main__":
    BUCKET_NAME = "your-s3-bucket-name"
    FILE_PATH = "path/to/your/file.csv"
    upload_to_s3(BUCKET_NAME, FILE_PATH)
