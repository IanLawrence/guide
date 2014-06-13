**Description:**
Updates a child record in the system

**URL:**
http://localhost:3000/api/children/{:child_id}

**Formats:**
JSON

**HTTP Method:**
PUT

**Requires**
 Authentication : true
 Authorization: should have Register Child permission

**Parameters:**
Updated fields as @child[ fieldname1 ], child[ fieldname2 ]@

**Returns:**
Updated child record in JSON or XML format
