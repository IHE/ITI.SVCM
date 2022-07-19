Profile:      AuditSvcmConceptMapRead
Parent:       https://profiles.ihe.net/ITI/BALP/StructureDefinition/IHE.BasicAudit.Read
Id:           IHE.SVCM.Audit.ConceptMap.Read
Title:        "Audit Event for Query Concept Map Transaction by the Terminology Consumer and Repository for Read"
Description:  """
Defines constraints on the AuditEvent Resource to record when a Query Concept Map Transaction happens
to read a ConceptMap, as recorded by the Terminology Consumer and Registry.
"""
* subtype 2..*
* subtype contains iti100 1..1
* subtype[iti100] = urn:ihe:event-type-code#ITI-100 "Query Concept Map"
* entity[data]
  * role = http://terminology.hl7.org/ConceptMap/object-role#4 "Domain Resource"
  * what 1..1
  * what only Reference(ConceptMap)

Profile:      AuditSvcmConceptMapQuery
Parent:       https://profiles.ihe.net/ITI/BALP/StructureDefinition/IHE.BasicAudit.Query
Id:           IHE.SVCM.Audit.ConceptMap.Query
Title:        "Audit Event for Query Concept Map Transaction by the Terminology Consumer and Repository for Query"
Description:  """
Defines constraints on the AuditEvent Resource to record when a Query Concept Map Transaction happens
to query a ConceptMap, as recorded by the Terminology Consumer and Registry.
"""
* subtype 2..*
* subtype contains iti100 1..1
* subtype[iti100] = urn:ihe:event-type-code#ITI-100 "Query Concept Map"
