param managementGroupName1 string
param managementGroupName2 string
param policyDefinitionId1 string
param policyDefinitionId2 string

resource policyAssignment1 'Microsoft.Authorization/policyAssignments@2019-09-01' = {
  name: 'infraEncryptionPolicyAssignment'
  properties: {
    displayName: 'Storage Accounts Infrastructure Encryption Policy'
    policyDefinitionId: policyDefinitionId1
    scope: managementGroupResourceId(managementGroupName1)
    description: 'Policy to audit infrastructure encryption for storage accounts in the first management group.'
  }
}

resource policyAssignment2 'Microsoft.Authorization/policyAssignments@2019-09-01' = {
  name: 'secureTransferPolicyAssignment'
  properties: {
    displayName: 'Secure Transfer to Storage Accounts Policy'
    policyDefinitionId: policyDefinitionId2
    scope: managementGroupResourceId(managementGroupName2)
    description: 'Policy to audit secure transfer to storage accounts in the second management group.'
  }
}