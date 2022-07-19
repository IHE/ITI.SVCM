Profile:      SVCMConceptMap
Parent:       ConceptMap
Id:           IHE.SVCM.ConceptMap
Title:        "SVCM ConceptMap"
Description:  "A profile on the ConceptMap resource for SVCM."

* url 1..1
* url ^short = "For existing concept maps with an id in other formats, the URL can be expressed as a URN, e.g., urn:oid:X.X.X. Otherwise the value shall be a URL."
* identifier ^short = "The identifier shall contain any business identifiers this concept map is identified by."