**Description:**
Returns all child records in the system.

**URL:**
http://localhost:3000/api/children

**Formats:**
JSON

**HTTP Method:**
GET

**Requires:**
 Authentication : true
 Authorization: View And Search Child

**Parameters:**
none

**Returns:**
All child records in JSON format.

**Exceptions:**
403 Unauthorized exception if the user is not authorized to view children

***

**Description:**
YET TO BE IMPLEMENTED Returns all child records in the system based on last_updated_at timestamp.

**URL:**
http://localhost:3000/api/children?last_updated_at="2012-10-13:17:24"

**Formats:**
JSON

**HTTP Method:**
GET

**Requires:**
 Authentication : true
 Authorization: View And Search Child

**Parameters:**
none

**Returns:**
All child records where last_updated_at is >= "2012-10-13:17:24" in JSON format.

**Exceptions:**
403 Unauthorized exception if the user is not authorized to view children
