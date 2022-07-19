Profile:      SVCMValueSet
Parent:       ValueSet
Id:           IHE.SVCM.ValueSet
Title:        "SVCM ValueSet"
Description:  "A profile on the ValueSet resource for SVCM."

* url 1..1
* url ^short = "For existing value sets with an id in other formats, the URL can be expressed as a URN, e.g., urn:oid:X.X.X. Otherwise the value shall be a URL."
* identifier ^short = "The identifier shall contain any business identifiers this value set is identified by."