# This script checks the replication status between domain controllers in the AD environment.
Get-ADReplicationPartnerMetadata -Target (Get-ADDomainController)

Select-Object Server, Partner, LastReplicationSuccess, LastReplicationResult
