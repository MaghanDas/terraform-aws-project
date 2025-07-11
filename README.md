# Terraform AWS EC2 Instance Project

## Overview

This project demonstrates using Terraform to provision an AWS infrastructure from scratch, including:

- Creating a VPC with a public subnet, internet gateway, and route table.
- Provisioning an EC2 instance with security group and SSH key.
- Installing and running a simple Nginx web server on the EC2 instance.

## Features

- Modular Terraform code with separate VPC and EC2 modules.
- Use of variables and outputs.
- Deploy infrastructure on AWS Free Tier.

## Prerequisites

- AWS Account with access keys configured.
- Terraform installed (v1.0+ recommended).
- Basic knowledge of AWS and Terraform.

## How to Use

1. Clone the repo:

```bash
git clone https://github.com/yourusername/terraform-aws-project.git
cd terraform-aws-project
