Instance:     SVCMExampleCodeSystem
InstanceOf:   SVCMCodeSystem
Usage:          #example

* id = "svcm-example-codesystem"
* name = "SVCMExampleCodeSystem"
* version = "1.0.0"
* publisher = "Example Publisher"
* status = #active
* title = "SVCM Example CodeSystem"
* description = "An example CodeSystem for SVCM"
* caseSensitive = false
* content = #complete
* experimental = true
* url = "http://example.org/svcm/example"
* concept[+]
  * code = #example
  * display = "Example"
  * definition = "Example Concept"

Instance:     SVCMExampleCodeSystem2
InstanceOf:   SVCMCodeSystem
Usage:          #example

* id = "svcm-example-codesystem2"
* name = "SVCMExampleCodeSystem2"
* version = "1.0.0"
* publisher = "Example Publisher"
* status = #active
* title = "SVCM Example 2 CodeSystem"
* description = "An example CodeSystem for SVCM for mapping"
* caseSensitive = false
* content = #complete
* experimental = true
* url = "http://example.org/svcm/example2"
* concept[+]
  * code = #example
  * display = "Example"
  * definition = "Example Concept"

Instance:       SVCMExampleValueSet
InstanceOf:     SVCMValueSet
Usage:          #example

* id = "svcm-example-valueset"
* name = "SVCMExampleValueSet"
* version = "1.0.0"
* publisher = "Example Publisher"
* status = #active
* experimental = true
* title = "SVCM Example ValueSet"
* description = "An example ValueSet for SVCM"

* url = "http://example.org/svcm/example-valueset"
* compose.include.system = "http://example.org/svcm/example"

Instance:       SVCMExample2ValueSet
InstanceOf:     SVCMValueSet
Usage:          #example

* id = "svcm-example2-valueset"
* name = "SVCMExample2ValueSet"
* version = "1.0.0"
* publisher = "Example Publisher"
* status = #active
* experimental = true
* title = "SVCM Example 2 ValueSet"
* description = "An example 2 ValueSet for SVCM"

* url = "http://example.org/svcm/example2-valueset"
* compose.include.system = "http://example.org/svcm/example2"

Instance:       SVCMExampleConceptMap
InstanceOf:     SVCMConceptMap
Usage:          #example

* url = "http://example.org/svcm/example-conceptmap"
* id = "svcm-example-conceptmap"
* name = "SVCM_Example_ConceptMap"
* version = "1.0.0"
* publisher = "Example Publisher"
* title = "SVCM Example ConceptMap"
* status = #draft
* experimental = true
* description = "An example ConceptMap for SVCM"
* sourceCanonical = "http://example.org/svcm/example-valueset"
* targetCanonical = "http://example.org/svcm/example2-valueset"

* group[+]
  * source = "http://example.org/svcm/example"
  * target = "http://example.org/svcm/example2"

  * element[+]
    * code = #example
    * target[+]
      * code = #example
      * equivalence = #equivalent
