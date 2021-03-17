# CONFIGURATION

  variable "github_token" {
    description = "Personal Access Token"
  }

  variable "archived_repo" {
    description = "Archived repo name"
  }

  variable "unarchived_repo" {
    description = "Active repo name, for comparison"
  }

  variable "vulnerability_alerts" {
    description = "Toggle vulnerability_alerts in both repos"
    type        = bool
    default     = true
  }

# SETUP
  terraform {
    required_version = "0.14.8"

    required_providers {
      github = {
        source  = "integrations/github"
        version = "4.5.1"
      }
    }
  }

  provider "github" {
    token = var.github_token
  }

# RESOURCES

  resource "github_repository" "archived" {
    name     = var.archived_repo
    archived = true

    auto_init            = true
    vulnerability_alerts = var.vulnerability_alerts
  }

  resource "github_repository" "unarchived" {
    name     = var.unarchived_repo
    archived = false

    auto_init            = true
    vulnerability_alerts = var.vulnerability_alerts
  }
