Profile:      AuditSvcmValidateCode
Parent:       OperationEvent
Id:           IHE.SVCM.Audit.Code.Validate
Title:        "Audit Event for Validate Code Transaction by the Terminology Consumer and Repository"
Description:  """
Defines constraints on the AuditEvent Resource to record when a Validate Code Transaction happens
to validate a code, as recorded by the Terminology Consumer and Registry.
"""
* subtype 2..*
* subtype contains iti99 1..1
* subtype[iti99] = urn:ihe:event-type-code#ITI-99 "Validate Code"
