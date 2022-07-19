Profile:      AuditSvcmValueSetExpand
Parent:       https://profiles.ihe.net/ITI/BALP/StructureDefinition/IHE.BasicAudit.Read
Id:           IHE.SVCM.Audit.ValueSet.Expand
Title:        "Audit Event for Expand Value Set Transaction by the Terminology Consumer and Repository"
Description:  """
Defines constraints on the AuditEvent Resource to record when an Expand Value Set Transaction happens
to expand a ValueSet, as recorded by the Terminology Consumer and Registry.
"""
* subtype 2..*
* subtype contains iti97 1..1
* subtype[iti97] = urn:ihe:event-type-code#ITI-97 "Expand Value Set"
* entity[data]
  * role = http://terminology.hl7.org/CodeSystem/object-role#4 "Domain Resource"
  * what 1..1
  * what only Reference(ValueSet)