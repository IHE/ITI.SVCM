Instance:     ex-AuditSvcmConceptMapTranslate
InstanceOf:   AuditSvcmConceptMapTranslate
Title:        "Audit example for ITI-101 for Terminology Consumer for translate code."
Description:  "Audit example for a Terminology Consumer requesting translate code for ITI-101."
Usage:        #example

* contained[+] = ex-SvcmTranslateCodeParameters
* subtype[operation] = http://hl7.org/fhir/restful-interaction#operation "operation"
* subtype[iti101] = urn:ihe:event-type-code#ITI-101 "Translate Code"
* recorded = 2022-04-13T19:33:45Z
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
* entity[parameters]
  * what = Reference(ex-SvcmTranslateCodeParameters)

Instance:       ex-SvcmTranslateCodeParameters
InstanceOf:     Parameters
Usage:          #inline

* parameter[+]
  * name = "url"
  * valueUri = "http://example.org/svcm/example-conceptmap"
* parameter[+]
  * name = "source"
  * valueUri = "http://example.org/svcm/example-valueset"
* parameter[+]
  * name = "code"
  * valueCode = #example
* parameter[+]
  * name = "system"
  * valueUri = "http://example.org/svcm/example"
* parameter[+]
  * name = "target"
  * valueUri = "http://example.org/svcm/example2-valueset"