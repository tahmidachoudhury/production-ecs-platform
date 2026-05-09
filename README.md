# Umami Analytics: Deployed via AWS ECS and IaC

---

## Description

…

### Table of Contents

- Live Demo
- Architecture
- Technology Stack
- Repository Structure
- Features
- Local Development
- Author

---

## Optional: Live Demo

…

---

## Architecture

![Architecture Diagram](./docs/ecs-v1-project.drawio.png)

---

## Technology Stack

…

---

## Repository Structure

```sh
app
├── docker-compose.yml
├── Dockerfile
└── src
    └── app
        └── api
            └── heartbeat
...
infra
├── bootstrap
│   ├── main.tf
│   ├── modules
│   │   └── ecr
│   │       ├── main.tf
│   │       ├── outputs.tf
│   │       └── variables.tf
│   ├── provider.tf
│   └── variables.tf
├── envs
├── modules
│   ├── acm
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── alb
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── application
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── cloudwatch
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── dns
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── ecs
│   │   ├── main.tf
│   │   └── variables.tf
│   ├── iam
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── networking
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── rds
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── security_groups
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
├── backend.tf
├── main.tf
├── outputs.tf
└── variables.tf
.github
└── workflows
    ├── docker-build-push.yml
    ├── terraform-apply.yml
    ├── terraform-destroy.yml
    └── terraform-plan.yml
```

---

## How to set up locally

…

---

### CI/CD

“workflow screenshots”

---

## Author

…

---

### Connect

…

---
