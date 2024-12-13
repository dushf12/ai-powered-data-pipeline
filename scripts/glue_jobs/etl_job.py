import sys
import boto3
import pandas as pd

def process_data(input_path, output_path):
    # Read data from S3 into a Pandas DataFrame
    df = pd.read_csv(input_path)
    
    # Transform data
    df['new_column'] = df['existing_column'] * 2
    
    # Save the transformed data back to S3
    df.to_csv(output_path, index=False)

def main():
    input_path = "s3://your-s3-bucket/input-data.csv"
    output_path = "s3://your-s3-bucket/processed-data.csv"
    
    process_data(input_path, output_path)

if __name__ == "__main__":
    main()
