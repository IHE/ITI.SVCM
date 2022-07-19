Profile:        OperationEvent
Parent:         AuditEvent
Id:             IHE.SVCM.Audit.Operation
Title:          "Basic AuditEvent for a successful Operation"
Description:    """
A basic AuditEvent profile for when a RESTful Operation action happens successfully.

- Given a RESTful Operation is requested
- And the request is authorized
  - Authorization failures should follow [FHIR core Access Denied](http://hl7.org/fhir/security.html#AccessDenied)
- When successful
  - Note a failure AuditEvent may follow this pattern, but would not be a successful outcome and should have an OperationOutcome
  - Note success may result in zero or more results. The number of results and the content of the results are not recorded.
- Then the AuditEvent recorded will conform
  - The raw operation parameters is placed in the .contained element. The contained parameters enables preserving exactly what was requested, including possibly malicious patterns. This enables detection of malicious or malformed requests.

Note: the pattern defined in DICOM and IHE have the client is identified as the Source Role ID, and the server is identified as the Destination Role ID. This represents the query parameters are flowing from the client to the server. This may not be so obvious, as the data actually flows the opposite direction. This pattern is established and thus followed here.
"""
* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* contained ^slicing.discriminator.type = #value
* contained ^slicing.discriminator.path = "$this"
* contained ^slicing.rules = #open
* contained 1..
* contained contains parameters 1..1
* contained[parameters] only Parameters
* subtype ^slicing.discriminator.type = #value
* subtype ^slicing.discriminator.path = "$this"
* subtype ^slicing.rules = #open // allow other codes
* subtype 1..
* subtype contains operation 1..1
* subtype[operation] = http://hl7.org/fhir/restful-interaction#operation "operation" (exactly)
* action = #E
* recorded 1..1
// failures are recorded differently
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* agent ^slicing.discriminator.type = #pattern
* agent ^slicing.discriminator.path = "type"
* agent ^slicing.rules = #open
* agent 2..
* agent contains 
    client 1..1 and 
    server 1..1 and 
    user 0..1
* agent[client].type = http://dicom.nema.org/resources/ontology/DCM#110153 "Source Role ID"
* agent[client].who 1..1 // client identifier, May be an Device Resource, but more likely an identifier given the App identified in the OAuth token 
* agent[client].network 1..1 // as known by TCP connection information
* agent[client].media 0..0 
* agent[server].type = http://dicom.nema.org/resources/ontology/DCM#110152 "Destination Role ID"
* agent[server].who 1..1 // server identifier. May be a Device Resource, but likely just an identifier of the domain name
* agent[server].network 1..1 // as known by TCP connection information
* agent[server].media 0..0 
* agent[user].type = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#IRCP "information recipient"
* agent[user].who 1..1 // May be a Resource, but likely just an identifier from the OAuth token
* agent[user].requestor = true
* agent[user].role MS // if the OAuth token includes any roles, they are recorded here
* agent[user].name MS // might also be in .who.text but here is searchable
* agent[user].media 0..0 // media is physical storage media identification
* agent[user].network 0..0 // users are not network devices
* agent[user].purposeOfUse MS // if the OAuth token includes a PurposeOfUse it is recorded here
* source MS // what agent recorded the event. Likely the client or server but might be an intermediary
* entity ^slicing.discriminator.type = #pattern
* entity ^slicing.discriminator.path = "type"
* entity ^slicing.rules = #open
* entity 1..
* entity contains 
	transaction 0..1 and
    parameters 1..1
* entity[transaction].type = BasicAuditEntityType#XrequestId
* entity[transaction].what.identifier.value 1..1
* entity[transaction].what.identifier.value ^short = "the value of X-Request-Id"
* entity[parameters].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[parameters].role = http://terminology.hl7.org/CodeSystem/object-role#4 "Domain Resource"
* entity[parameters].what 1..1
* entity[parameters].what only Reference(Parameters)
* entity[parameters].lifecycle 0..0 
* entity[parameters].securityLabel ^short = "may contain the security labels on the Bundle search set returned"
* entity[parameters].description 0..1 
* entity[parameters].query 0..0
* entity[parameters].detail 0..0