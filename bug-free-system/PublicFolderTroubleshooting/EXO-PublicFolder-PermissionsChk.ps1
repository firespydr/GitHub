# Created by Chris Osborn
# Created 8/1/22

# This script was created to check users permissions to the Public folders and help troubleshoot issues.

# The issue is that some subfolders of a particular Public folder (with attached mailbox) are not visble for certain users. 
# Providing subfolder access and checking membership of the Security Group does not always provide a good fix. 

# Connect to Exchange Online
Connect-ExchangeOnline

#Variables
$user="testy.testerson@ncontracts.com"

#Get User details EXO modules do not seem to work. Reverting to RPS
Get-Mailbox -Identity joe.user | Format-List *public*

#! Which public folder?

#Check permissions on primary hierarchy public folder mailbox
Get-PublicFolderClientPermission \puf1 -User joe.user -Mailbox (Get-Mailbox -PublicFolder | ?{$_.IsRootPublicFolderMailbox -eq "True"}).Name




