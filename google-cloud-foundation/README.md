# Google Cloud Foundation

This module contains the foundational environment on Google Cloud.

The modules was initially created using [Google Cloud Setup guided flow](https://docs.cloud.google.com/docs/enterprise/cloud-setup).

## Architecture

- **`folders`:**
  - Creates a hierarchical structure under the organization for logical grouping of projects (e.g., "Common" "Landing Zones" "Sandbox", "Decommissioned"). [Learn more](https://cloud.google.com/resource-manager/docs/creating-managing-folders).

- **`projects`:**
  - Provisions projects within the defined folders for isolating resources and applying specific policies. [Learn more](https://cloud.google.com/resource-manager/docs/creating-managing-projects).

- **`iam`:**
  - Defines Identity and Access Management roles and bindings at the organization, folder, and project levels to control access to resources. [Learn more](https://cloud.google.com/iam/docs/overview).

- **`org-policy`:**
  - Configures security using Org Policies for centralized control and Security Command Center for threat detection and response. [Org Policies](https://cloud.google.com/resource-manager/docs/organization-policy/overview) [Security Command Center](https://cloud.google.com/security-command-center/docs/optimize-security-command-center)

- **`monitoring`:**
  - Centralizes metrics scope so that metrics from all of your projects can be viewed through a single scoping project. [Learn more](https://cloud.google.com/monitoring/settings).
