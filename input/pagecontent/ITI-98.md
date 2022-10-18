This section corresponds to transaction \[ITI-98\] of the IHE IT
Infrastructure Technical Framework. Transaction \[ITI-98\] is used by
the Terminology Consumer and Terminology Repository Actors.

### 2:3.98.1 Scope

This transaction is used by the Terminology Consumer to lookup a given
code to return the full details. The request is received by the
Terminology Repository. The Terminology Repository processes the request
and returns a response of the code details as a Parameters Resource.

### 2:3.98.2 Actor Roles

**Table 2:3.98.2-1: Actor Roles**

| ---------- | ---------------------------------------------------------------------------------------- |
| **Actor:** | Terminology Consumer                                                                     |
| **Role:**  | Requests code details from the Terminology Repository.                                   |
| **Actor:** | Terminology Repository                                                                   |
| **Role:**  | Returns information for the code based on criteria provided by the Terminology Consumer. |
{:.grid .table-striped}

### 2:3.98.3 Referenced Standards

- HL7 FHIR standard R4 <http://hl7.org/fhir/R4/index.html> 

### 2:3.98.4 Messages

<div>
{%include ITI-98-seq.svg%}
</div>
<div style="clear: left;"></div>
**Figure 2:3.98.4-1: Interaction Diagram**

#### 2:3.98.4.1 Lookup Code Request Message

The Lookup Code Request message is a FHIR $lookup operation on the
CodeSystem Resource.

##### 2:3.98.4.1.1 Trigger Events

A Terminology Consumer triggers a Lookup Code Request to a Terminology
Repository according to the business rules for the lookup. These
business rules are outside the scope of this transaction.

##### 2:3.98.4.1.2 Message Semantics

A Terminology Consumer initiates an $lookup request using HTTP GET as
defined at <http://hl7.org/fhir/codesystem-operation-lookup.html> on the
CodeSystem Resource. The required input parameters are identified in
Table 2:3.98.4.1.2-1.

The URL for this operation is: `[base]/CodeSystem/$lookup?[parameter=value]`

Where \[base\] is the URL of Terminology Repository.

See [ITI TF-2: Appendix W](https://profiles.ihe.net/ITI/TF/Volume2/ch-W.html) for informative implementation material for
this transaction.

**Table 2:3.98.4.1.2-1: Lookup Code Message HTTP Input Parameters**

<table class="grid table-striped">
<thead>
<tr class="header" style="background-color: #e8e8e8;">
<th>Input Parameter Name</th>
<th>IHE Constraint</th>
<th>Search Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>code<br/>
[0..1]</td>
<td>[1..1]</td>
<td>code</td>
<td>The code that is to be located. If a code is provided, a system must be provided.</td>
</tr>
<tr>
<td>system<br/>
[0..1]</td>
<td>[1..1]</td>
<td>uri</td>
<td>The system for the code that is to be located.</td>
</tr>
<tr>
<td>_format<br/>
[0..1]</td>
<td></td>
<td>mime-type</td>
<td>The requested format of the response from the mime-type value set. See <a href="https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.6-populating-the-expected-response-format">ITI TF-2: Appendix Z.6</a>.</td>
</tr>
<tr>
<td>version<br/>
[0..1]</td>
<td></td>
<td>string</td>
<td>The version of the system, if one was provided in the source data.</td>
</tr>
<tr>
<td>coding<br/>
[0..1]</td>
<td>[0..0]<br/>
This parameter is not allowed when the code+system parameters are used.</td>
<td>Coding</td>
<td></td>
</tr>
<tr>
<td>date<br/>
[0..1]</td>
<td></td>
<td>dateTime</td>
<td>The date for which the information should be returned. Normally, this is the current conditions (which is the default value) but under some circumstances, systems need to access this information as it would have been in the past. A typical example of this would be where code selection is constrained to the set of codes that were available when the patient was treated, not when the record is being edited. Note that which date is appropriate is a matter for implementation policy.</td>
</tr>
<tr>
<td>displayLanguage<br/>
[0..1]</td>
<td></td>
<td>code</td>
<td>The requested language for display (see $expand.displayLanguage).</td>
</tr>
<tr>
<td>property<br/>
[0..*]</td>
<td></td>
<td>code</td>
<td>A property that the client wishes to be returned in the output. If no properties are specified, the server chooses what to return. The following properties are defined for all code systems: url, name, version (code system info) and code information: display, definition, designation, parent and child, and for designations, lang.X where X is a designation language code. Some of the properties are returned explicit in named parameters (when the names match), and the rest (except for lang.X) in the property parameter group.</td>
</tr>
</tbody>
</table>

###### 2:3.98.4.1.2.1 Example Request Message

An example request message from
<http://hl7.org/fhir/codesystem-operation-lookup.html> is:

```
GET [base]/CodeSystem/$lookup?system=http://loinc.org&code=1963-8
```

##### 2:3.98.4.1.3 Expected Actions

The Terminology Repository shall process the input parameters to
discover the code that matches the parameters given and return a
response as per Section 2:3.98.4.2 or an OperationOutcome Resource with an
error message.

#### 2:3.98.4.2 Lookup Code Response Message

##### 2:3.98.4.2.1 Trigger Events

The Terminology Repository found the code matching the input parameters
specified by the Terminology Consumer as a result of a Lookup Code
Request.

##### 2:3.98.4.2.2 Message Semantics

See [ITI TF-2: Appendix Z.6](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.6-populating-the-expected-response-format) for more details on response format
handling. See [ITI TF-2: Appendix Z.7](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.7-guidance-on-access-denied-results) for handling guidance for Access
Denied.

The response message is a FHIR Parameters Resource with properties of
the code based on the out parameters defined at
<http://hl7.org/fhir/codesystem-operation-lookup.html> and reproduced in
Table 2:3.98.4.2.2-1.

**Table 2:3.98.4.2.2-1: Lookup Code Message HTTP Output Parameters**

<table class="grid table-striped">
<thead>
<tr class="header" style="background-color: #e8e8e8;">
<th>Parameter Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>name<br/>
[1..1]</td>
<td>string</td>
<td>A display name for the code system</td>
</tr>
<tr>
<td>version<br/>
[0..1]</td>
<td>string</td>
<td>The version that these details are based on</td>
</tr>
<tr>
<td>display<br/>
[1..1]</td>
<td>string</td>
<td>The preferred display for this concept</td>
</tr>
<tr>
<td>designation<br/>
[0..*]</td>
<td></td>
<td>Additional representations for this concept</td>
</tr>
<tr>
<td>designation.language<br/>
[0..1]</td>
<td>code</td>
<td>The language this designation is defined for</td>
</tr>
<tr>
<td>designation.use<br/>
[0..1]</td>
<td>Coding</td>
<td>A code that details how this designation would be used</td>
</tr>
<tr>
<td>designation.value<br/>
[1..1]</td>
<td>string</td>
<td>The text value for this designation</td>
</tr>
<tr>
<td>property<br/>
[0..*]</td>
<td></td>
<td>One or more properties that contain additional information about the code, including status. For complex terminologies (e.g., SNOMED CT, LOINC, medications), these properties serve to decompose the code</td>
</tr>
<tr>
<td>property.code<br/>
[1..1]</td>
<td>code</td>
<td>Identifies the property returned</td>
</tr>
<tr>
<td>property.value<br/>
[0..1]</td>
<td>code | Coding | string | integer | boolean | dateTime | decimal</td>
<td>The value of the property returned</td>
</tr>
<tr>
<td>property.description<br/>
[0..1]</td>
<td>string</td>
<td>Human Readable representation of the property value (e.g., display for a code)</td>
</tr>
<tr>
<td>property.subproperty<br/>
[0..*]</td>
<td></td>
<td>Nested Properties (mainly used for SNOMED CT decomposition, for relationship Groups)</td>
</tr>
<tr>
<td>property.subproperty.code<br/>
[1..1]</td>
<td>code</td>
<td>Identifies the sub-property returned</td>
</tr>
<tr>
<td>property.subproperty.value<br/>
[1..1]</td>
<td>code | Coding | string | integer | boolean | dateTime | decimal</td>
<td>The value of the sub-property returned</td>
</tr>
<tr>
<td>property.subproperty.description<br/>
[0..1]</td>
<td>string</td>
<td>Human Readable representation of the sub-property value (e.g., display for a code)</td>
</tr>
</tbody>
</table>

###### 2:3.98.4.2.2.1 Example Response Message

An example successful response message from
<http://hl7.org/fhir/codesystem-operation-lookup.html> is:

```
HTTP/1.1 200 OK
[other headers]

{
  "resourceType" : "Parameters",
  "parameter" : [
    {
      "name" : "name",
      "valueString" : "LOINC"
    },
    {
      "name" : "version",
      "valueString" : "2.48"
    },
    {
      "name" : "display",
      "valueString" : "Bicarbonate [Moles/volume] in Serum"
    },
    {
      "name" : "abstract",
      "valueString" : "false"
    },
    {
      "name" : "designation",
      "part" : [
        {
          "name" : "value",
          "valueString" : "Bicarbonate [Moles/volume] in Serum"
        }
      ]
    }
  ]
}
```

An example failed response message from
<http://hl7.org/fhir/codesystem-operation-lookup.html> is:

```
HTTP/1.1 200 OK
[other headers]

{
  "resourceType": "OperationOutcome",
  "id": "exception",
  "text": {
    "status": "additional",
    "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\">Code "ABC-23" not found</div>"
  },
  "issue": [
    {
      "severity": "error",
      "code": "not-found",
      "details": {
        "text": "Code "ABC-23" not found"
      }
    }
  ]
}
```

##### 2:3.98.4.2.3 Expected Actions

The Terminology Consumer has received the response and continues with
its workflow.

### 2:3.98.5 Security Considerations

See the general Security Consideration in [ITI TF-1: 51.5](volume-1.html#1515-svcm-security-considerations).

#### 2:3.98.5.1 Security Audit Considerations

Note that the same audit message is recorded by both Terminology Consumer and Repository. The
difference being the Audit Source element. Both sides record to show consistency
between the message sent by the Consumer and the action taken at the Registry.

The actors involved shall record audit events according to the
[Audit Event for Lookup Code by the Terminology Consumer and Repository](StructureDefinition-IHE.SVCM.Audit.CodeSystem.Lookup.html).