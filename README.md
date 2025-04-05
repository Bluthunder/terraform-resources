# 🌍 Terraform Infrastructure Setup

This repository contains Terraform configuration files for provisioning infrastructure.

---

## 📁 Project Structure

```
.
├── .github/                 # GitHub-specific files and workflows
├── .terraform/              # Local Terraform state and config (auto-generated)
├── .gitignore               # Git ignored files and directories
├── .terraform.lock.hcl      # Terraform provider dependency lock file
├── LICENSE                  # License information
├── main.tf                  # Main Terraform configuration
├── README.md                # You're here!
├── terraform.tfstate        # Terraform state file (usually ignored in VCS)
├── terraform.tfstate.backup# Backup of the state file
├── user_data.sh             # Shell script for EC2 user data or provisioning
└── variables.tf             # Input variables for Terraform

```

## 🛠️ Prerequisites

Ensure the following are installed:

- [Terraform](https://developer.hashicorp.com/terraform/downloads) >= 1.0
- AWS CLI or your cloud provider CLI (if applicable)
- Credentials setup (e.g., AWS credentials in `~/.aws/credentials`)

---

## 🚀 Getting Started

### 1. Clone the repository

```
git clone https://github.com/yourusername/your-terraform-repo.git
cd your-terraform-repo
```

### 2. Initialize Terraform

```
terrform init

```

### 3. Review the execution plan 

```
terraform plan

```

### 4. Apply the configuration 

```
terrform apply

```
### 5. Destroy resource (after done)

```
terrform destroy

```

## 📄 Files Explained

- **main.tf** – Core infrastructure definitions.
- **variables.tf** – Input variables with types and default values.
- **user_data.sh** – Shell script executed on EC2 or other VM-based resources.
- **terraform.tfstate** – Current state of infrastructure (avoid editing manually).
- **.terraform.lock.hcl** – Lock file for provider versions.
- **.gitignore** – Ignores local files like `.terraform/`, `.tfstate`, etc.


# 📦 Installing Terraform

Follow the steps below to install Terraform on your system:

✅ For macOS (with Homebrew)

```
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
terraform -v
```

✅ For Linux

```
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt install terraform
terraform -v

```

✅ For Windows

- Download the .zip file from Terraform Downloads

- Extract it and add the folder to your system PATH

- Run terraform -v to verify installation
