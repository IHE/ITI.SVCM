Profile:      AuditSvcmCodeSystemRead
Parent:       https://profiles.ihe.net/ITI/BALP/StructureDefinition/IHE.BasicAudit.Read
Id:           IHE.SVCM.Audit.CodeSystem.Read
Title:        "Audit Event for Query Code System Transaction by the Terminology Consumer and Repository for Read"
Description:  """
Defines constraints on the AuditEvent Resource to record when a Query Code System Transaction happens
to read a CodeSystem, as recorded by the Terminology Consumer and Registry.
"""
* subtype 2..*
* subtype contains iti96 1..1
* subtype[iti96] = urn:ihe:event-type-code#ITI-96 "Query Code System"
* entity[data]
  * role = http://terminology.hl7.org/CodeSystem/object-role#4 "Domain Resource"
  * what 1..1
  * what only Reference(CodeSystem)

Profile:      AuditSvcmCodeSystemQuery
Parent:       https://profiles.ihe.net/ITI/BALP/StructureDefinition/IHE.BasicAudit.Query
Id:           IHE.SVCM.Audit.CodeSystem.Query
Title:        "Audit Event for Query Code System Transaction by the Terminology Consumer and Repository for Query"
Description:  """
Defines constraints on the AuditEvent Resource to record when a Query Code System Transaction happens
to query a CodeSystem, as recorded by the Terminology Consumer and Registry.
"""
* subtype 2..*
* subtype contains iti96 1..1
* subtype[iti96] = urn:ihe:event-type-code#ITI-96 "Query Code System"
