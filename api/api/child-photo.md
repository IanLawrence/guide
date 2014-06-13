**Description:**
Returns child photos in the system.

**URL:**
http://localhost:3000/api/children/{:child_id}/photo/{:photo_id}

**Formats:**
JSON

**HTTP Method:**
GET

**Requires:**
 Authentication : true

**Parameters:**
none

**Returns:**
All child photo in JSON format.

**Exceptions:**
403 Unauthorized exception if the user is not authorized to view children
