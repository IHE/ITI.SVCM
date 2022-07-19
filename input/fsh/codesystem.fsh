Profile:      SVCMCodeSystem
Parent:       CodeSystem
Id:           IHE.SVCM.CodeSystem
Title:        "SVCM CodeSystem"
Description:  "A profile on the CodeSystem resource for SVCM."

* url 1..1
* url ^short = "For existing code systems with an id in other formats, the URL can be expressed as a URN, e.g., urn:oid:X.X.X. Otherwise the value shall be a URL."
* identifier ^short = "The identifier shall contain any business identifiers this code system is identified by."