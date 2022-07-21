Instance:     ex-AuditSvcmValueSetExpand
InstanceOf:   AuditSvcmValueSetExpand
Title:        "Audit example for ITI-97 for Terminology Consumer for expand."
Description:  "Audit example for a Terminology Consumer requesting Expand ValueSet for ITI-97."
Usage:        #example

* subtype[anyRead] = http://hl7.org/fhir/restful-interaction#read "read"
* subtype[iti97] = urn:ihe:event-type-code#ITI-97 "Expand Value Set"
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