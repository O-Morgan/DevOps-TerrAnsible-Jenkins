# DevOps-TerrAnsible-Jenkins

## Overview

This repository is a hands-on project that integrates **Terraform**, **Ansible**, and **Jenkins** to deploy and manage cloud infrastructure efficiently. It covers setting up an automated CI/CD pipeline, managing cloud resources using Infrastructure as Code (IaC), and leveraging automation tools for configuration management.

## Features

- **Infrastructure as Code** with Terraform
- **Configuration Management** using Ansible
- **CI/CD Automation** with Jenkins
- **OIDC Authentication** for AWS access via GitHub Actions
- **GitHub Actions Workflows** for automated deployments
- **Terraform State Management** with AWS S3 and DynamoDB

## Technologies Used

- **Terraform** - Infrastructure provisioning
- **Ansible** - Configuration management
- **Jenkins** - CI/CD pipeline automation
- **AWS** - Cloud infrastructure provider
- **GitHub Actions** - Automated workflows
- **Gitpod & GitHub Codespaces** - Cloud development environments

## Table of Contents

- [GitHub Codespaces vs Gitpod](#github-codespaces-vs-gitpod)
- [Installing and Configuring Terraform](#installing-and-configuring-terraform)
- [Setting Up Terraform Project](#setting-up-terraform-project)
- [Using CloudFormation for OIDC Authentication](#using-cloudformation-for-oidc-authentication)
- [Setting Up GitHub Actions](#setting-up-github-actions)
- [Semantic Versioning](#semantic-versioning)
- [Useful Git Commands](#useful-git-commands)
- [Reference Documentation](#reference-documentation)

## GitHub Codespaces vs Gitpod

Using **GitHub Codespaces** over **Gitpod** provides several advantages:

- **Built-in Terraform Support**: Terraform can be installed and used immediately.
- **Better Secret Management**: GitHub Codespaces instantly highlights potential secret exposure issues, unlike Gitpod.
- **VS Code Integration**: Gitpod uses a third-party VS Code variant, while Codespaces provides the full experience.
- **Faster Environment Setup**: In Gitpod, you may need to create a `bin` directory to manually configure the environment, which can slow down project setup.

## Installing and Configuring Terraform

To install Terraform, follow the official [Terraform installation guide](https://developer.hashicorp.com/terraform/install).

```bash
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | 
sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

## Setting Up Terraform Project

1. Create a directory for your Terraform files (e.g., `mtc-terransible`).
2. Inside the directory, create:
   - `providers.tf`
   - `main.tf`
3. Run `terraform init`.
4. **Versioning Consideration**: You don't have to specify the Terraform version in providers.tf. After initialization, a .terraform.lock.hcl file is created, where the locked version can be referenced. If you wish to lock in the latest version within the provider block, you can find the exact version inside this lock file, as documentation versions can sometimes be slightly out of date.

## Using CloudFormation for OIDC Authentication

To configure AWS OIDC role access, use a **CloudFormation template**. [Reference documentation](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_create_oidc.html).

## Setting Up GitHub Actions

1. Create a directory structure:
   ```plaintext
   .github/workflows/
   ```
2. Inside `.github/workflows/`, create your workflow YAML files:
   - `plan.yml`: Runs on every pull request to the `main` branch.
   - `apply.yml`: To be added for applying infrastructure changes.

## Semantic Versioning

Semantic Versioning (SemVer) is a versioning convention that follows the format **MAJOR.MINOR.PATCH**:

- **MAJOR**: Incompatible API changes
- **MINOR**: New functionality added in a backward-compatible manner
- **PATCH**: Backward-compatible bug fixes

Example:
- `v1.0.0`: Initial stable release
- `v1.1.0`: New features added, but backward-compatible
- `v1.1.1`: Bug fixes with no functional changes

[More details on Semantic Versioning](https://semver.org/).

## Useful Git Commands

### Deleting a Tag
```bash
git tag -d <tag-name>
git push origin --delete <tag-name>
```

### Checking Out a Branch
```bash
git checkout <branch-name>
```

### Creating and Switching to a New Branch
```bash
git checkout -b <new-branch>
```

### Merging a Branch into Main
```bash
git checkout main
git merge <branch-name>
```

## Reference Documentation

### Terraform

- [Terraform Installation](https://developer.hashicorp.com/terraform/install)
- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Terraform Best Practices](https://developer.hashicorp.com/terraform/tutorials)
- [GitHub Terraform Action](https://github.com/hashicorp/setup-terraform)

### GitHub Actions

- [GitHub Actions Starter Workflows](https://github.com/actions/starter-workflows)

## Future Enhancements

- Implement Terraform modules for modular infrastructure
- automate the the initialisation, plan and apply phases through workflow actions.



## License

This project is licensed under the MIT License.



add a piece on tf state management include deleting items from dynamo db if previous locks have been created incorrectly state conflict happens 