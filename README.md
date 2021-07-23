# engaging-networks-rest
Client gem for the ENS API to Engaging Networks

[![CI Status](https://github.com/controlshift/engaging-networks-rest/actions/workflows/ci.yml/badge.svg)](https://github.com/controlshift/engaging-networks-rest/actions/workflows/ci.yml)

## Install

`gem install engaging-networks-rest`

## Usage

```
client = EngagingNetworksRest.new(api_key: 'YOUR API KEY HERE')

# get pages by type
pages = client.pages(type: 'dcf', status: 'live')

# process a page request
response = client.process_page_request(page_id: 12345, body: {supporter: {first_name: 'Alice'}})
```

The client will call authentication endpoint behind the scenes the first time it makes a request.
Currently, it does not attempt to check if its token is still valid for later requests.
It is possible to force re-authentication with `client.authenticate!`.
