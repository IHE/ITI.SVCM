Instance:     ExampleCodeSystem
InstanceOf:   SVCMCodeSystem
Title:       "SVCM Example CodeSystem"
Usage:          #example
* name = "ExampleCodeSystem"
* url = "http://example.org/svcm/example-codesystem"
* version = "1.0.0"
* publisher = "Example Publisher"
* status = #active
* title = "SVCM Example CodeSystem"
* description = "An example CodeSystem for SVCM"
* caseSensitive = false
* content = #complete
* experimental = true
* concept[+]
  * code = #example
  * display = "Example"
  * definition = "Example Concept"

Instance:     ExampleCodeSystem2
InstanceOf:   SVCMCodeSystem
Title:       "SVCM Example 2 CodeSystem"
Usage:          #example
* name = "ExampleCodeSystem2"
* url = "http://example.org/svcm/example2-codesystem"
* version = "1.0.0"
* publisher = "Example Publisher"
* status = #active
* title = "SVCM Example 2 CodeSystem"
* description = "An example CodeSystem for SVCM for mapping"
* caseSensitive = false
* content = #complete
* experimental = true
* concept[+]
  * code = #example
  * display = "Example"
  * definition = "Example Concept"

Instance:       ExampleValueSet
InstanceOf:     SVCMValueSet
Title:      "SVCM Example ValueSet"
Usage:          #example
* name = "ExampleValueSet"
* url = "http://example.org/svcm/example-valueset"
* version = "1.0.0"
* publisher = "Example Publisher"
* status = #active
* experimental = true
* title = "SVCM Example ValueSet"
* description = "An example ValueSet for SVCM"
* compose.include.system = Canonical(ExampleCodeSystem)

Instance:       Example2ValueSet
InstanceOf:     SVCMValueSet
Title:      "SVCM Example 2 ValueSet" 
Usage:          #example
* name = "Example2ValueSet"
* url = "http://example.org/svcm/example2-valueset"
* version = "1.0.0"
* publisher = "Example Publisher"
* status = #active
* experimental = true
* title = "SVCM Example 2 ValueSet"
* description = "An example 2 ValueSet for SVCM"
* compose.include.system = Canonical(ExampleCodeSystem2)

Instance:       ExampleConceptMap
InstanceOf:     SVCMConceptMap
Title:      "SVCM Example ConceptMap"
Usage:          #example
* url = "http://example.org/svcm/example-conceptmap"
* id = "example-conceptmap"
* name = "SVCM_Example_ConceptMap"
* version = "1.0.0"
* publisher = "Example Publisher"
* title = "SVCM Example ConceptMap"
* status = #draft
* experimental = true
* description = "An example ConceptMap for SVCM"
* group[+]
  * source = Canonical(ExampleCodeSystem)
  * target = Canonical(ExampleCodeSystem2)
  * element[+]
    * code = #example
    * target[+]
      * code = #example
      * equivalence = #equivalent
