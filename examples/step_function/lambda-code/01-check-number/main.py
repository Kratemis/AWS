import json

def lambda_handler(event, context):
    number = event['number']
    result = "even" if number % 2 == 0 else "odd"
    return {
        'number': number,
        'result': result
    }
