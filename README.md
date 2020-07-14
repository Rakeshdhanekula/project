# Session Manager

Secured way for connecting session-manger in AWS

## Description

Provision SSM Documents, EC2 Instances and Instance Profiles for Session Manager

The terraform script provides recommended settings:

1. No open inbound ports
2. Loggable session activity

## How to connect

1. Check the formating 
2. Terraform Validate      # Validate the configuration
3. Terraform plan
4. Terraform apply         # To auto apply, use --auto-approve

Usage: 

  terraform fmt 

Where `${fmt}`=Format
