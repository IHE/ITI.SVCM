Instance:     ex-AuditSvcmValueSetRead
InstanceOf:   AuditSvcmValueSetRead
Title:        "Audit example for ITI-95 for Terminology Consumer for read."
Description:  "Audit example for a Terminology Consumer requesting a read on a ValueSet for ITI-95."
Usage:        #example

* subtype[anyRead] = http://hl7.org/fhir/restful-interaction#read "read"
* subtype[iti95] = urn:ihe:event-type-code#ITI-95 "Query Value Set"
//* action = http://hl7.org/fhir/audit-event-action#C
* recorded = 2022-04-13T19:33:45Z
//* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.site = "server.example.com"
* source.observer = Reference(Device/ex-device)
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* agent[server].type = DCM#110153 "Source Role ID"
* agent[server].requestor = false
* agent[server].who = Reference(Device/ex-device)
* agent[server].network.address = "http://server.example.com/fhir"
* agent[server].network.type = http://hl7.org/fhir/network-type#5 "URI"
* agent[client].type = DCM#110152 "Destination Role ID"
* agent[client].requestor = false
* agent[client].who.display = "myMachine.example.org"
* agent[client].network.address = "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
* agent[client].network.type = http://hl7.org/fhir/network-type#2 "IP Address"
* entity[data]
  * what = Reference(SVCMExampleValueSet)

Instance:     ex-AuditSvcmValueSetQuery
InstanceOf:   AuditSvcmValueSetQuery
Title:        "Audit example for ITI-95 for Terminology Consumer for query."
Description:  "Audit example for a Terminology Consumer requesting a query on a ValueSet for ITI-95."
Usage:        #example
* subtype[anySearch] = http://hl7.org/fhir/restful-interaction#search "search"
* subtype[iti95] = urn:ihe:event-type-code#ITI-95 "Query Value Set"
//* action = http://hl7.org/fhir/audit-event-action#C
* recorded = 2022-04-13T19:33:45Z
//* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.site = "server.example.com"
* source.observer = Reference(Device/ex-device)
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* agent[client].type = DCM#110153 "Source Role ID"
* agent[client].requestor = false
* agent[client].who = Reference(Device/ex-device)
* agent[client].network.address = "http://server.example.com/fhir"
* agent[client].network.type = http://hl7.org/fhir/network-type#5 "URI"
* agent[server].type = DCM#110152 "Destination Role ID"
* agent[server].requestor = false
* agent[server].who.display = "myMachine.example.org"
* agent[server].network.address = "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
* agent[server].network.type = http://hl7.org/fhir/network-type#2 "IP Address"
* entity[query].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[query].role = http://terminology.hl7.org/CodeSystem/object-role#24 "Query"
* entity[query].query = "dXJsPWh0dHA6Ly9leGFtcGxlLm9yZy9zdmNtL2V4YW1wbGUtdmFsdWVzZXQK"

Instance:     ex-device
InstanceOf:   Device
Title:        "Device Example for SVCM"
Description:  """
Device Example for SVCM.
"""
Usage:        #example
