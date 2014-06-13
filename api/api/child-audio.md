**Description:**
Download child audio in the system.

**URL:**
http://localhost:3000/api/children/{:child_id}/audio/{:audio_id}

**Formats:**
JSON

**HTTP Method:**
GET

**Requires:**
 Authentication : true

**Parameters:**
none

**Returns:**
All child audio in JSON format.

**Exceptions:**
403 Unauthorized exception if the user is not authorized to view children
