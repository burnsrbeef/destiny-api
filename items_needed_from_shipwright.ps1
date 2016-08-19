#Base code for querying API was gathered from http://bungienetplatform.wikia.com/wiki/Getting_Started
#E-mail code obtained from numerous StackOverflow responses like so http://stackoverflow.com/questions/17562559/send-email-from-powershell-command-line-with-credentials, sorry, cant remember each specific post i gathered from. https://www.google.com/search?q=send+mail+powershell+stack+overflow&ie=utf-8&oe=utf-8

#obtain an api key from bungie.net
$apikey = 'enter your api key inside these single quotes'
#ID of vendor to query, can be found in the url of the vendor on destinydb.com
$uri = 'https://www.bungie.net/Platform/Destiny/Vendors/459708109/'
 
#Hashtable to hold headers
$headers = @{}
$headers.add('X-API-KEY', $apikey)
 
#Best practice is to use Invoke-WebRequest, cURL can be used as an alias.
$request = Invoke-WebRequest -Headers $headers -URI $uri -Method Get
 
#Convert HtmlWebRequestObject to PSCustomObject
$results = ConvertFrom-Json $request.Content

#Declare variable for loop
$hashcount = 0

#Hash number of items you want to be notified if available, can be found in the url of the item on destinydb.com
$ax19 = 1491990345
$afv1 = 4254137631
$afv2 = 4254137624
$afv3 = 4254137625
$ns22 = 268122075
$ns44 = 268122076
$cx20 = 1491990349

#Loop through vendor items testing against items needed, "while" condition should be 1 less than number of items vendor has available. Send mail if test for item needed is positive. notepad++ has a nice extension for viewing json files so you can navigate the tree to find the path to the item (json viewer)
DO{
    $results.response.data.saleItemCategories[1].saleItems[$hashcount].item.itemHash
        IF($results.response.data.saleItemCategories[1].saleItems[$hashcount].item.itemHash -eq $ax19 -Or $results.response.data.saleItemCategories[1].saleItems[$hashcount].item.itemHash -eq $afv1 -Or $results.response.data.saleItemCategories[1].saleItems[$hashcount].item.itemHash -eq $afv2 -Or $results.response.data.saleItemCategories[1].saleItems[$hashcount].item.itemHash -eq $afv3 -Or $results.response.data.saleItemCategories[1].saleItems[$hashcount].item.itemHash -eq $ns22 -Or $results.response.data.saleItemCategories[1].saleItems[$hashcount].item.itemHash -eq $ns44 -Or $results.response.data.saleItemCategories[1].saleItems[$hashcount].item.itemHash -eq $ns66 -Or $results.response.data.saleItemCategories[1].saleItems[$hashcount].item.itemHash -eq $cx20 -Or $results.response.data.saleItemCategories[1].saleItems[$hashcount].item.itemHash -eq $ex21){
        #Create generic email account at outlook.com to use to send email to desired mailbox. 
		$EmailFrom = "emailyoucreated@outlook.com"
        $EmailTo = "mailbox@whereever.com" 
        $Subject = "Shipwright is selling something" 
        $Body = "Shipwright is selling something" 
        $SMTPServer = "smtp.live.com" 
        $SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 587) 
        $SMTPClient.EnableSsl = $true 
        $SMTPClient.Credentials = New-Object System.Net.NetworkCredential("emailyoucreated@outlook.com", "password for account"); 
        $SMTPClient.Send($EmailFrom, $EmailTo, $Subject, $Body)
        }
    $hashcount++
}WHILE ($hashcount -le 5)