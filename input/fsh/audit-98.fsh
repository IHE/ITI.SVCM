Profile:      AuditSvcmCodeSystemLookup
Parent:       OperationEvent
Id:           IHE.SVCM.Audit.CodeSystem.Lookup
Title:        "Audit Event for Lookup Code Transaction by the Terminology Consumer and Repository"
Description:  """
Defines constraints on the AuditEvent Resource to record when a Lookup Code Transaction happens
to expand a CodeSystem, as recorded by the Terminology Consumer and Registry.
"""
* subtype 2..*
* subtype contains iti98 1..1
* subtype[iti98] = urn:ihe:event-type-code#ITI-98 "Lookup Code"
