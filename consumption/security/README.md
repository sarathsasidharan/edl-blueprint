# Security Setup For Workspace Access

This part focuses on security access patterns which could be used to govern the data usage from synapse

- User/Department Group has only SQL On Demand Access to a limited folders / files
  - User/Department Group needs to be added as a Blob Data Contributor on the primary storage account.
  - User was not able to list files when it had no blob data contributor access
  
- User/Group/Department has only Spark Pool Access to limited folders /files
- User/Group/Departement has access to create pipelines / deploy pipelines
