Profile:      AuditSvcmConceptMapTranslate
Parent:       OperationEvent
Id:           IHE.SVCM.Audit.ConceptMap.Translate
Title:        "Audit Event for Translate Code Transaction by the Terminology Consumer and Repository"
Description:  """
Defines constraints on the AuditEvent Resource to record when a Translate Code Transaction happens
to translate a code using a ConceptMap, as recorded by the Terminology Consumer and Registry.
"""
* subtype 2..*
* subtype contains iti101 1..1
* subtype[iti101] = urn:ihe:event-type-code#ITI-101 "Translate Code"
