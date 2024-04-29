import json

def lambda_handler(event, context):
    number = event['number']
    result = event['result']
    message = f"The number {number} is {result}."
    return {
        'message': message
    }
