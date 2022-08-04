# Created by Chris Osborn
# Created 8/1/22
# Adapted from https://docs.microsoft.com/en-us/exchange/troubleshoot/public-folders/public-folder-permission-issues#troubleshooting-steps

# This script was created to check users permissions to the Public folders and help troubleshoot issues.

# The issue is that some subfolders of a particular Public folder (with attached mailbox) are not visble for certain users. 
# Providing subfolder access and checking membership of the Security Group does not always provide a good fix.

# Connect to Exchange Online
Connect-ExchangeOnline

#Variables
#$user="testy.testerson@yo.com"

#1.  Verify the public folder mailbox that is assigned to the user. 
    #! Note: EXO (Exchange Online) modules do not display this information. Reverting to (RPS) Remote Powershell Cmdlets. Need to find solution.
    Get-Mailbox -Identity "jon.doe" | Format-List *public*

#2.  Verify that the public folder permission is replicated to the public folder mailbox that is assigned to the user.

    #a.  Check permissions on primary hierarchy public folder mailbox
    Get-PublicFolderClientPermission "\puf1" -User "joe.user" -Mailbox (Get-Mailbox -PublicFolder | ?{$_.IsRootPublicFolderMailbox -eq "True"}).Name

    #b. Check the permissions on the folder for the user on the public folder mailbox that you got from step 1
    Get-PublicFolderClientPermission "\puf1" -User "joe.user" -Mailbox "Mailbox from Step 1"

#3. Error There is no existing permision Entry found for user 1?

#4. Manually Replicate the Public folder permissions for the user/group 
Update-PublicFolderMailbox "Mailbox from Step 1" -InvokeSynchronizer

#5. Verify permissions
Get-PublicFolderClientPermission "\puf1" -User "joe.user" -Mailbox "Mailbox from Step 1"