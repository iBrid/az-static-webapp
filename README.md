# az-static-webapp
This repository demonstrates how to deploy a static web app using Terraform. The project provides IaC templates to provision resources such as cloud storage, CDN, etc. Easily customizable, it serves as a practical starting point for developers looking to automate the deployment of fast, secure, and highly available static sites with Terraform.

## Terraform Cloud workspace variables

This repo is configured to use Terraform Cloud (see `terrafrom.tf`) and requires a repository token for VCS integration with the Static Web App resource.

You must set the following workspace environment variables in Terraform Cloud (Workspace → Variables → Environment variables):

- `ARM_CLIENT_ID` (sensitive) — Service principal client id used by Terraform to authenticate to Azure
- `ARM_CLIENT_SECRET` (sensitive) — Service principal secret
- `ARM_TENANT_ID` — Azure tenant id
- `ARM_SUBSCRIPTION_ID` — Azure subscription id
- `TF_VAR_repository_token` (sensitive) — Repository/deploy token for your GitHub repo (used by `azurerm_static_web_app`)

Notes:
- `TF_VAR_repository_token` maps to the Terraform variable `repository_token` through the `TF_VAR_` prefix. Mark it as sensitive so it cannot be viewed after creation.
- You can use a GitHub Personal Access Token (with repo scope) or a Static Web Apps deployment token.

After setting these variables, queue a run in the Terraform Cloud workspace to provision resources and connect the Static Web App to the repository.

