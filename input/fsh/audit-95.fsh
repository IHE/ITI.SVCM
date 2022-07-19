Profile:      AuditSvcmValueSetRead
Parent:       https://profiles.ihe.net/ITI/BALP/StructureDefinition/IHE.BasicAudit.Read
Id:           IHE.SVCM.Audit.ValueSet.Read
Title:        "Audit Event for Query Value Set Transaction by the Terminology Consumer and Repository for Read"
Description:  """
Defines constraints on the AuditEvent Resource to record when a Query Value Set Transaction happens
to read a ValueSet, as recorded by the Terminology Consumer and Registry.
"""
* subtype 2..*
* subtype contains iti95 1..1
* subtype[iti95] = urn:ihe:event-type-code#ITI-95 "Query Value Set"
* entity[data]
  * role = http://terminology.hl7.org/CodeSystem/object-role#4 "Domain Resource"
  * what 1..1
  * what only Reference(ValueSet)

Profile:      AuditSvcmValueSetQuery
Parent:       https://profiles.ihe.net/ITI/BALP/StructureDefinition/IHE.BasicAudit.Query
Id:           IHE.SVCM.Audit.ValueSet.Query
Title:        "Audit Event for Query Value Set Transaction by the Terminology Consumer and Repository for Query"
Description:  """
Defines constraints on the AuditEvent Resource to record when a Query Value Set Transaction happens
to query a ValueSet, as recorded by the Terminology Consumer and Registry.
"""
* subtype 2..*
* subtype contains iti95 1..1
* subtype[iti95] = urn:ihe:event-type-code#ITI-95 "Query Value Set"
