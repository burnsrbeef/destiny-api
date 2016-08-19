#Base code for querying API was gathered from http://bungienetplatform.wikia.com/wiki/Getting_Started

#Insert your API key.
$apikey = 'api-key'

#Edit the following as needed. Go to bungie.net and view one of your characters. In the address bar everything after /Gear is your {membershipType}/{destinyMembershipId}/{characterId}/. Edit and remove as needed.
$uri1 = 'http://www.bungie.net/Platform/Destiny/Stats/ActivityHistory/{membershipType}/{destinyMembershipId}/{characterId}/'
$uri2 = 'http://www.bungie.net/Platform/Destiny/Stats/ActivityHistory/{membershipType}/{destinyMembershipId}/{characterId}/'
$uri3 = 'http://www.bungie.net/Platform/Destiny/Stats/ActivityHistory/{membershipType}/{destinyMembershipId}/{characterId}/'

#Hashtable to hold headers.
$headers = @{}
$headers.add('X-API-KEY', $apikey)

#Query API and save json files in directory you run script in. Edit and remove as needed.
Invoke-WebRequest -Headers $headers -URI $uri1 -Method Get -OutFile .\rumble_games_titan.json
Invoke-WebRequest -Headers $headers -URI $uri2 -Method Get -OutFile .\rumble_games_warlock.json
Invoke-WebRequest -Headers $headers -URI $uri3 -Method Get -OutFile .\rumble_games_hunter.json
