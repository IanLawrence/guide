## Common Notes

* Only JSON is supported
* All requests must be under "/api" namespace
* Once logged in, an API session expires in one week
* Session tokens are stored as encrypted cookies
* Any API call which is not under "/api" is deprecated and needs to be ported

## Getting Started

* First call the Login API `/api/login`
* Save the `Set-Cookie` returned by this API call, This cookie must be used for all subsequent requests
* For all subsequent requests, set the `Cookie` header
* Call `/api/logout` at the end to invalidate the cookie

## Security

* The cookie is encrypted and can be decrypted only by the server
* If you don't call the API for a certain timeout (presently 20 minutes), it will automatically log you out and you then have to login again
