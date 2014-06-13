**Description:**
Creates a new child record in the system

**URL:**
http://localhost:3000/api/children

**Formats:**
JSON

**HTTP Method:**
POST

**Requires:**
 Authentication: true
 Authorization: should have Register Child permission

**Parameters:**
* @child[ last_known_location ]@  Optional
* @child[ photo ]@ Optional
* @child[ created_at ]@ Optional: defaults to the date the record is posted to the blackberry client
* @child[ posted_from]@ Required: should be set to 'Mobile'
* Addition optional fields

**Returns:**
New child record in JSON format
<pre><code>{"is_caregiver_alive":"","other_child_2_address":"","other_org_date":"","interviewers_org":"","_id":"59cd40f39ab6aa791f73885e3bdd99f9","wishes_contacted_details":"","mothers_name":"","other_org_place":"","other_child_1_birthplace":"","gender":"","fathers_name":"","nick_name":"","separation_details":"","father_death_details":"","other_child_1_telephone":"","dob_or_age":"","disclosure_other_orgs":"","created_organisation":"N/A","concerns_street_child":"","evacuation_agent":"","photo_keys":[],"other_child_3_dob":"","protection_status":"Unaccompanied","orther_org_reference_no":"","care_arrangments_name":"","other_child_3_address":"","evacuation_to":"","concerns_girl_mother":"","b02509bc":"","is_father_alive":"","current_photo_key":"","care_arrangements_address":"","separation_place":"","other_child_2_telephone":"","created_at":"2012-12-06 06:32:09UTC","interview_subject":"","care_arrangements_arrival_date":"","other_org_country":"","b024ded8":"","evacuation_status":"","b02503a4":"","disclosure_public_name":"","name":"name","disclosure_public_relatives":"","evacuation_date":"","b024f6a2":"","concerns_needs_followup":"","languages":"","concerns_vulnerable_person":"","last_updated_by":"rapidftr","wishes_wants_contact":"","other_child_2_relationship":"","posted_from":"Browser","documents":"","separation_date":"","id_document":"","other_child_1_dob":"","care_arrangements_other":"","created_by_full_name":"RapidFTR","care_arrangements_familyinfo":"","concerns_other":"","concerns_abuse_situation":"","disclosure_public_photo":"","couchrest-type":"Child","other_org_name":"","additional_tracing_info":"","characteristics":"","wishes_name_1":"","concerns_chh":"","caregivers_name":"","wishes_name_2":"","concerns_further_info":"","wishes_name_3":"","ethnicity_or_tribe":"","mother_death_details":"","interviewer":"","other_child_3_telephone":"","histories":[{"user_organisation":"N/A","changes":{"protection_status":{"from":"","to":"Unaccompanied"}},"user_name":"rapidftr","datetime":"2012-12-06 06:40:11UTC"}],"posted_at":"2012-12-06 06:32:09UTC","governing_org":"","care_arrangements_came_from":"","other_child_3_birthplace":"","address":"","nationality":"","concerns_disabled":"","birthplace":"","other_child_1":"","b024e892":"","created_by":"rapidftr","other_family":"","other_child_1_relationship":"","care_arrangements_knowsfamily":"","wishes_telephone_1":"","concerns_followup_details":"","other_child_1_address":"","wishes_telephone_2":"","other_child_2":"","concerns_medical_case":"","is_mother_alive":"","wishes_telephone_3":"","last_updated_by_full_name":"RapidFTR","other_child_3":"","interview_subject_details":"","care_arrangements":"","care_arrangements_relationship":"","other_org_interview_status":"","last_updated_at":"2012-12-06 06:40:11UTC","_rev":"3-48fc3d53aa9775aa516652514e1ee9f1","other_child_3_relationship":"","interview_date":"","telephone":"","wishes_address_1":"","other_child_2_dob":"","wishes_address_2":"","evacuation_from":"","wishes_contacted":"","interview_place":"","disclosure_deny_details":"","unique_identifier":"5120ba2e-a71a-4d18-a409-ffbb85c5ccf7","rc_id_no":"2234234","wishes_address_3":"","disclosure_authorities":"","other_child_2_birthplace":"","names_origin":""}</code></pre>

**Possible authorization exception**
`403 status code with appropriate exception`
