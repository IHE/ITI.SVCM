Instance: IHE.SVCM.TerminologyConsumer
InstanceOf: CapabilityStatement
Usage: #definition
* description = "CapabilityStatement for Terminology Consumer Actor in the IHE IT Infrastructure Technical Framework Supplement [SVCM](index.html)."
//* text.status = #additional
//* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t\tCapabilityStatement for Terminology Consumer Actor in the IHE IT Infrastructure Technical Framework Supplement\r\n\t\t\t<a href=\"https://profiles.ihe.net/ITI/SVCM/index.html\">SVCM</a>\r\n</div>"
* name = "IHE_SVCM_TerminologyConsumer"
* title = "IHE SVCM Terminology Consumer"
* status = #active
* experimental = false
* date = "2022-03-31"
* publisher = "Integrating the Healthcare Enterprise (IHE)"
* contact[+]
  * name = "IHE"
  * telecom
    * system = #url
    * value = "http://ihe.net"
* copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property"
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest
  * mode = #client
  * documentation = "SVCM Terminology Consumer will query for terminology resources."
  * security
    * cors = false
    * description = "None mandated by IHE, encouraged IHE-IUA or SMART-on-FHIR"
  * resource[+]
    * type = #ValueSet
    * supportedProfile = "https://profiles.ihe.net/ITI/SVCM/StructureDefinition/IHE.SVCM.ValueSet"
    * documentation = "For Query Value Set [ITI-95], Expand Value Set [ITI-97], Validate Code [ITI-99]"
    * interaction[+].code = #search-type
    * interaction[+].code = #read
    * searchParam[+]
      * name = "_id"
      * type = #token
    * searchParam[+]
      * name = "_lastUpdate"
      * type = #date
    * searchParam[+]
      * name = "status"
      * type = #token
    * searchParam[+]
      * name = "identifier"
      * type = #token
    * searchParam[+]
      * name = "name"
      * type = #string
    * searchParam[+]
      * name = "description"
      * type = #string
    * searchParam[+]
      * name = "reference"
      * type = #uri
    * searchParam[+]
      * name = "title"
      * type = #string
    * searchParam[+]
      * name = "url"
      * type = #uri
    * searchParam[+]
      * name = "version"
      * type = #token
    * operation[+]
      * name = "$expand"
      * definition = "http://hl7.org/fhir/OperationDefinition/ValueSet-expand"
      * documentation = """
`url` is a required parameter for this operation.
"""
    * operation[+]
      * name = "$validate-code"
      * definition = "http://hl7.org/fhir/OperationDefinition/ValueSet-validate-code"
      * documentation = """
`url`, `code`, and `system` are required parameters for this operation.
"""
  * resource[+]
    * type = #CodeSystem
    * supportedProfile = "https://profiles.ihe.net/ITI/SVCM/StructureDefinition/IHE.SVCM.CodeSystem"
    * documentation = "For Query Code System [ITI-96], Lookup Code [ITI-98], Validate Code [ITI-99]"
    * interaction[+].code = #search-type
    * interaction[+].code = #read
    * searchParam[+]
      * name = "_id"
      * type = #token
    * searchParam[+]
      * name = "_lastUpdate"
      * type = #date
    * searchParam[+]
      * name = "status"
      * type = #token
    * searchParam[+]
      * name = "identifier"
      * type = #token
    * searchParam[+]
      * name = "name"
      * type = #string
    * searchParam[+]
      * name = "description"
      * type = #string
    * searchParam[+]
      * name = "system"
      * type = #uri
    * searchParam[+]
      * name = "title"
      * type = #string
    * searchParam[+]
      * name = "url"
      * type = #uri
    * searchParam[+]
      * name = "version"
      * type = #token
    * operation[+]
      * name = "$lookup"
      * definition = "http://hl7.org/fhir/OperationDefinition/CodeSystem-lookup"
      * documentation = """
`code` and `system` are required parameters for this operation.
"""
    * operation[+]
      * name = "$validate-code"
      * definition = "http://hl7.org/fhir/OperationDefinition/CodeSystem-validate-code"
      * documentation = """
`url` and `code` are required parameters for this operation.
"""
  * resource[+]
    * type = #ConceptMap
    * supportedProfile = "https://profiles.ihe.net/ITI/SVCM/StructureDefinition/IHE.SVCM.ConceptMap"
    * documentation = "For Query Concept Map [ITI-100] and Translate Code [ITI-101]"
    * interaction[+].code = #search-type
    * interaction[+].code = #read
    * searchParam[+]
      * name = "_id"
      * type = #token
    * searchParam[+]
      * name = "_lastUpdate"
      * type = #date
    * searchParam[+]
      * name = "status"
      * type = #token
    * searchParam[+]
      * name = "identifier"
      * type = #token
    * searchParam[+]
      * name = "name"
      * type = #string
    * searchParam[+]
      * name = "description"
      * type = #string
    * searchParam[+]
      * name = "title"
      * type = #string
    * searchParam[+]
      * name = "url"
      * type = #uri
    * searchParam[+]
      * name = "version"
      * type = #token
    * searchParam[+]
      * name = "source-system"
      * type = #token
    * searchParam[+]
      * name = "source-uri"
      * type = #reference
    * searchParam[+]
      * name = "target-system"
      * type = #token
    * searchParam[+]
      * name = "target-uri"
      * type = #reference
    * operation[+]
      * name = "$translate"
      * definition = "http://hl7.org/fhir/OperationDefinition/ConceptMap-translate"
      * documentation = """
`url`, `source`, `code`, `system`, and `target` are required parameters for this operation.
"""
  * interaction.code = #search-system

Instance: IHE.SVCM.TerminologyRepository
InstanceOf: CapabilityStatement
Usage: #definition
* description = "CapabilityStatement for Terminology Repository Actor in the IHE IT Infrastructure Technical Framework Supplement [SVCM](index.html)."
//* text.status = #additional
//* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t\tCapabilityStatement for Terminology Repository Actor in the IHE IT Infrastructure Technical Framework Supplement\r\n\t\t\t<a href=\"https://profiles.ihe.net/ITI/SVCM/index.html\">SVCM</a>\r\n</div>"
* name = "IHE_SVCM_TerminologyRepository"
* title = "IHE SVCM Terminology Repository"
* status = #active
* experimental = false
* date = "2022-03-31"
* publisher = "Integrating the Healthcare Enterprise (IHE)"
* contact[+]
  * name = "IHE"
  * telecom
    * system = #url
    * value = "http://ihe.net"
* copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property"
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest
  * mode = #server
  * documentation = "SVCM Terminology Repository will respond to queries for terminology resources."
  * security
    * cors = false
    * description = "None mandated by IHE, encouraged IHE-IUA or SMART-on-FHIR"
  * resource[+]
    * type = #ValueSet
    * supportedProfile = "https://profiles.ihe.net/ITI/SVCM/StructureDefinition/IHE.SVCM.ValueSet"
    * documentation = "For Query Value Set [ITI-95], Expand Value Set [ITI-97], Validate Code [ITI-99]"
    * interaction[+].code = #search-type
    * interaction[+].code = #read
    * searchParam[+]
      * name = "_id"
      * type = #token
    * searchParam[+]
      * name = "_lastUpdate"
      * type = #date
    * searchParam[+]
      * name = "status"
      * type = #token
    * searchParam[+]
      * name = "identifier"
      * type = #token
    * searchParam[+]
      * name = "name"
      * type = #string
    * searchParam[+]
      * name = "description"
      * type = #string
    * searchParam[+]
      * name = "reference"
      * type = #uri
    * searchParam[+]
      * name = "title"
      * type = #string
    * searchParam[+]
      * name = "url"
      * type = #uri
    * searchParam[+]
      * name = "version"
      * type = #token
    * operation[+]
      * name = "$expand"
      * definition = "http://hl7.org/fhir/OperationDefinition/ValueSet-expand"
      * documentation = """
`url` is a required parameter for this operation.
"""
    * operation[+]
      * name = "$validate-code"
      * definition = "http://hl7.org/fhir/OperationDefinition/ValueSet-validate-code"
      * documentation = """
`url`, `code`, and `system` are required parameters for this operation.
"""
  * resource[+]
    * type = #CodeSystem
    * supportedProfile = "https://profiles.ihe.net/ITI/SVCM/StructureDefinition/IHE.SVCM.CodeSystem"
    * documentation = "For Query Code System [ITI-96], Lookup Code [ITI-98], Validate Code [ITI-99]"
    * interaction[+].code = #search-type
    * interaction[+].code = #read
    * searchParam[+]
      * name = "_id"
      * type = #token
    * searchParam[+]
      * name = "_lastUpdate"
      * type = #date
    * searchParam[+]
      * name = "status"
      * type = #token
    * searchParam[+]
      * name = "identifier"
      * type = #token
    * searchParam[+]
      * name = "name"
      * type = #string
    * searchParam[+]
      * name = "description"
      * type = #string
    * searchParam[+]
      * name = "system"
      * type = #uri
    * searchParam[+]
      * name = "title"
      * type = #string
    * searchParam[+]
      * name = "url"
      * type = #uri
    * searchParam[+]
      * name = "version"
      * type = #token
    * operation[+]
      * name = "$lookup"
      * definition = "http://hl7.org/fhir/OperationDefinition/CodeSystem-lookup"
      * documentation = """
`code` and `system` are required parameters for this operation.
"""
    * operation[+]
      * name = "$validate-code"
      * definition = "http://hl7.org/fhir/OperationDefinition/CodeSystem-validate-code"
      * documentation = """
`url` and `code` are required parameters for this operation.
"""
  * resource[+]
    * type = #ConceptMap
    * supportedProfile = "https://profiles.ihe.net/ITI/SVCM/StructureDefinition/IHE.SVCM.ConceptMap"
    * documentation = "For Query Concept Map [ITI-100] and Translate Code [ITI-101]"
    * interaction[+].code = #search-type
    * interaction[+].code = #read
    * searchParam[+]
      * name = "_id"
      * type = #token
    * searchParam[+]
      * name = "_lastUpdate"
      * type = #date
    * searchParam[+]
      * name = "status"
      * type = #token
    * searchParam[+]
      * name = "identifier"
      * type = #token
    * searchParam[+]
      * name = "name"
      * type = #string
    * searchParam[+]
      * name = "description"
      * type = #string
    * searchParam[+]
      * name = "title"
      * type = #string
    * searchParam[+]
      * name = "url"
      * type = #uri
    * searchParam[+]
      * name = "version"
      * type = #token
    * searchParam[+]
      * name = "source-system"
      * type = #token
    * searchParam[+]
      * name = "source-uri"
      * type = #reference
    * searchParam[+]
      * name = "target-system"
      * type = #token
    * searchParam[+]
      * name = "target-uri"
      * type = #reference
    * operation[+]
      * name = "$translate"
      * definition = "http://hl7.org/fhir/OperationDefinition/ConceptMap-translate"
      * documentation = """
`url`, `source`, `code`, `system`, and `target` are required parameters for this operation.
"""
  * interaction.code = #search-system
