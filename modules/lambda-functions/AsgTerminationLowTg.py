import boto3
import logging
import json
import time

# Setup logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)

def lambda_handler(event, context):
    logger.info("Running custom termination script")
    logger.info(f"Event received: {event}")

    # Extract the SNS message
    try:
        sns_message = event['Records'][0]['Sns']['Message']
        message_dict = json.loads(sns_message)
        instance_id = message_dict['EC2InstanceId']
    except KeyError as e:
        logger.error(f"Key error: {e}")
        return {
            'statusCode': 400,
            'body': 'Event does not contain expected keys'
        }
    except Exception as e:
        logger.error(f"Error: {e}")
        return {
            'statusCode': 500,
            'body': 'Internal server error'
        }

    # Optional delay to ensure the instance is in the correct state
    time.sleep(10)  # Adjust the delay as needed

    # Execute SSM command
    ssm_client = boto3.client('ssm')
    
    try:
        response = ssm_client.send_command(
            InstanceIds=[instance_id],
            DocumentName="AWS-RunShellScript",
            Parameters={'commands': ['sudo sh /tmp/apach_tomcat_restart.sh']}
        )
        logger.info(f"SSM command response: {response}")
    except Exception as e:
        logger.error(f"Error executing SSM command: {e}")
    
    # Complete the lifecycle action
    client = boto3.client('autoscaling')
    
    try:
        response = client.complete_lifecycle_action(
            LifecycleHookName=message_dict['LifecycleHookName'],
            AutoScalingGroupName=message_dict['AutoScalingGroupName'],
            LifecycleActionToken=message_dict['LifecycleActionToken'],
            LifecycleActionResult='CONTINUE',
            InstanceId=instance_id
        )
        logger.info(f"Lifecycle action response: {response}")
    except Exception as e:
        logger.error(f"Error completing lifecycle action: {e}")
    
    return {
        'statusCode': 200,
        'body': 'Success'
    }

'''
import boto3
import logging
import json

# Setup logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)

def lambda_handler(event, context):
    logger.info("Running custom termination script")
    logger.info(f"Event received: {event}")

    # Extract the SNS message
    try:
        sns_message = event['Records'][0]['Sns']['Message']
        message_dict = json.loads(sns_message)
        instance_id = message_dict['EC2InstanceId']
    except KeyError as e:
        logger.error(f"Key error: {e}")
        return {
            'statusCode': 400,
            'body': 'Event does not contain expected keys'
        }
    except Exception as e:
        logger.error(f"Error: {e}")
        return {
            'statusCode': 500,
            'body': 'Internal server error'
        }

    # Execute SSM command
    ssm_client = boto3.client('ssm')
    
    try:
        response = ssm_client.send_command(
            InstanceIds=[instance_id],
            DocumentName="AWS-RunShellScript",
            Parameters={'commands': ['sudo sh /tmp/apach_tomcat_restart.sh']}
        )
        logger.info(f"SSM command response: {response}")
    except Exception as e:
        logger.error(f"Error executing SSM command: {e}")
    
    # Complete the lifecycle action
    client = boto3.client('autoscaling')
    
    try:
        response = client.complete_lifecycle_action(
            LifecycleHookName='TerminateHook',
            AutoScalingGroupName='tf-low-cost-asg',
            LifecycleActionResult='CONTINUE',
            InstanceId=instance_id
        )
        logger.info(f"Lifecycle action response: {response}")
    except Exception as e:
        logger.error(f"Error completing lifecycle action: {e}")
    
    return {
        'statusCode': 200,
        'body': 'Success'
    }

'''

'''
import boto3
import logging

# Setup logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)

def lambda_handler(event, context):
    logger.info("Running custom termination script")
    logger.info(f"Event received: {event}")

    # Fetch instance ID from the event
    try:
        instance_id = event['detail']['EC2InstanceId']
    except KeyError:
        logger.error("Event does not contain 'detail' key or 'EC2InstanceId'.")
        return {
            'statusCode': 400,
            'body': 'Event does not contain detail key or EC2InstanceId'
        }

    # Execute SSM command
    ssm_client = boto3.client('ssm')
    
    try:
        response = ssm_client.send_command(
            InstanceIds=[instance_id],
            DocumentName="AWS-RunShellScript",
            Parameters={'commands': ['sudo sh /tmp/apach_tomcat_restart.sh']}
        )
        logger.info(f"SSM command response: {response}")
    except Exception as e:
        logger.error(f"Error executing SSM command: {e}")
    
    # Complete the lifecycle action
    client = boto3.client('autoscaling')
    
    try:
        response = client.complete_lifecycle_action(
            LifecycleHookName='TerminateHook',
            AutoScalingGroupName='tf-low-cost-asg',
            LifecycleActionResult='CONTINUE',
            InstanceId=instance_id
        )
        logger.info(f"Lifecycle action response: {response}")
    except Exception as e:
        logger.error(f"Error completing lifecycle action: {e}")
    
    return {
        'statusCode': 200,
        'body': 'Success'
    }


'''
'''
import boto3
import logging

# Setup logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)

def lambda_handler(event, context):
    logger.info("Running custom termination script")

    # Fetch instance ID from the event
    instance_id = event['detail']['EC2InstanceId']
    
    # Execute SSM command
    ssm_client = boto3.client('ssm')
    
    try:
        response = ssm_client.send_command(
            InstanceIds=[instance_id],
            DocumentName="AWS-RunShellScript",
            Parameters={'commands': ['sudo sh /tmp/apach_tomcat_restart.sh']}
        )
        logger.info(f"SSM command response: {response}")
    except Exception as e:
        logger.error(f"Error executing SSM command: {e}")
    
    # Complete the lifecycle action
    client = boto3.client('autoscaling')
    
    try:
        response = client.complete_lifecycle_action(
            LifecycleHookName='TerminateHook',
            AutoScalingGroupName='tf-low-cost-asg',
            LifecycleActionResult='CONTINUE',
            InstanceId=instance_id
        )
        logger.info(f"Lifecycle action response: {response}")
    except Exception as e:
        logger.error(f"Error completing lifecycle action: {e}")
    
    return {
        'statusCode': 200,
        'body': 'Success'
    }

'''
'''
import boto3

def lambda_handler(event, context):
    # Your script logic here
    print("Running custom termination script")

    # Complete the lifecycle action
    client = boto3.client('autoscaling')
    response = client.complete_lifecycle_action(
        LifecycleHookName='TerminateHook',
        AutoScalingGroupName='tf-low-cost-asg',
        LifecycleActionResult='CONTINUE',
        InstanceId=event['detail']['EC2InstanceId']
    )
    return response
'''