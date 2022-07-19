This section corresponds to transaction \[ITI-99\] of the IHE IT
Infrastructure Technical Framework. Transaction \[ITI-99\] is used by
the Terminology Consumer and Terminology Repository Actors.

### 2:3.99.1 Scope

This transaction is used by the Terminology Consumer to validate the
existence of a given code in a value set or code system. The request is
received by the Terminology Repository. The Terminology Repository
processes the request and returns a response as a Parameters Resource.

### 2:3.99.2 Actor Roles

**Table 2:3.99.2-1: Actor Roles**

| ---------- | --------------------------------------------------------------------------------- |
| **Actor:** | Terminology Consumer                                                              |
| **Role:**  | Requests the code to validate from the Terminology Repository.                    |
| **Actor:** | Terminology Repository                                                            |
| **Role:**  | Returns validation information for the code provided by the Terminology Consumer. |
{:.grid .table-striped}

### 2:3.99.3 Referenced Standards

- HL7 FHIR standard R4 <http://hl7.org/fhir/R4/index.html>

### 2:3.99.4 Messages
<div>
{%include ITI-99-seq.svg%}
</div>
<div style="clear: left;"></div>
**Figure 2:3.99.4-1: Interaction Diagram**

#### 2:3.99.4.1 Validate ValueSet Code Request Message

The Validate ValueSet Code Request message is a FHIR $validate-code
operation on the ValueSet Resource.

##### 2:3.99.4.1.1 Trigger Events

A Terminology Consumer triggers a Validate ValueSet Code Request to a
Terminology Repository according to the business rules for the
validation. These business rules are outside the scope of this
transaction.

##### 2:3.99.4.1.2 Message Semantics

A Terminology Consumer initiates an $validate-code request using HTTP
GET as defined at
<http://hl7.org/fhir/valueset-operation-validate-code.html> on the
ValueSet Resource. The required input parameters are identified in Table
3.99.4.1.2-1.

The URL for this operation is: `[base]/ValueSet/$validate-code?[parameter=value]`

Where \[base\] is the URL of Terminology Repository.

See [ITI TF-2: Appendix W](https://profiles.ihe.net/ITI/TF/Volume2/ch-W.html) for informative implementation material for
this transaction.

**Table 2:3.99.4.1.2-1: Validate ValueSet Code Message HTTP Input Parameters**

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
<tr class="odd">
<td>url<br/>[0..1]</td>
<td>[1..1]</td>
<td>uri</td>
<td>Value set Canonical URL. The server must know the value set (e.g., it is defined explicitly in the server's value sets, or it is defined implicitly by some code system known to the server.</td>
</tr>
<tr class="even">
<td>code<br/>[0..1]</td>
<td>[1..1]</td>
<td>code</td>
<td>The code that is to be validated. If a code is provided, a system or a context must be provided (if a context is provided, then the server SHALL ensure that the code is not ambiguous without a system).</td>
</tr>
<tr class="odd">
<td>system<br/>[0..1]</td>
<td>[1..1]</td>
<td>uri</td>
<td>The system for the code that is to be validated.</td>
</tr>
<tr class="even">
<td>_format<br/>[0..1]</td>
<td>[0..1]</td>
<td>mime-type</td>
<td>The requested format of the response from the mime-type value set. See [ITI TF-2: Appendix Z.6](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.6-populating-the-expected-response-format).</td>
</tr>
<tr class="odd">
<td>context<br/>[0..1]</td>
<td>[0..0]<br/>
This parameter is not allowed when the url parameter is used.</td>
<td>uri</td>
<td></td>
</tr>
<tr class="even">
<td>valueSet<br/>[0..1]</td>
<td>[0..0]<br/>
This parameter is not allowed when the url parameter is used.</td>
<td>ValueSet</td>
<td></td>
</tr>
<tr class="odd">
<td>valueSetVersion<br/>[0..1]</td>
<td></td>
<td>string</td>
<td>The identifier that is used to identify a specific version of the value set to be used when validating the code. This is an arbitrary value managed by the value set author and is not expected to be globally unique. For example, it might be a timestamp (e.g., yyyymmdd) if a managed version is not available.</td>
</tr>
<tr class="even">
<td>systemVersion<br/>[0..1]</td>
<td></td>
<td>string</td>
<td>The version of the system, if one was provided in the source data</td>
</tr>
<tr class="odd">
<td>display<br/>[0..1]</td>
<td></td>
<td>string</td>
<td>The display associated with the code, if provided. If a display is provided a code must be provided. If no display is provided, the server cannot validate the display value, but may choose to return a recommended display name using the display parameter in the outcome. Whether displays are case sensitive is code system dependent</td>
</tr>
<tr class="even">
<td>coding<br/>[0..1]</td>
<td>[0..0]<br/>
This parameter is not allowed when the code+system parameters are used.</td>
<td>Coding</td>
<td></td>
</tr>
<tr class="odd">
<td>codeableConcept<br/>[0..1]</td>
<td>[0..0]<br/>
This parameter is not allowed when the code+system parameters are used.</td>
<td>CodeableConcept</td>
<td></td>
</tr>
<tr class="even">
<td>date<br/>[0..1]</td>
<td></td>
<td>dateTime</td>
<td>The date for which the validation should be checked. Normally, this is the current conditions (which is the default values) but under some circumstances, systems need to validate that a correct code was used at some point in the past. A typical example of this would be where code selection is constrained to the set of codes that were available when the patient was treated, not when the record is being edited. Note that which date is appropriate is a matter for implementation policy.</td>
</tr>
<tr class="odd">
<td>abstract<br/>[0..1]</td>
<td></td>
<td>boolean</td>
<td>If this parameter has a value of true, the client is stating that the validation is being performed in a context where a concept designated as 'abstract' is appropriate/allowed to be used, and the server should regard abstract codes as valid. If this parameter is false, abstract codes are not considered to be valid.<br/>
Note that 'abstract' is a property defined by many HL7 code systems that indicates that the concept is a logical grouping concept that is not intended to be used as a 'concrete' concept in an actual patient/care/process record. This language is borrowed from Object Oriented theory where 'abstract' objects are never instantiated. However, in the general record and terminology eco-system, there are many contexts where it is appropriate to use these codes e.g., as decision making criterion, or when editing value sets themselves. This parameter allows a client to indicate to the server that it is working in such a context.</td>
</tr>
<tr class="even">
<td>displayLanguage<br/>[0..1]</td>
<td></td>
<td>code</td>
<td>Specifies the language to be used for description when validating the display property</td>
</tr>
</tbody>
</table>

##### 2:3.99.4.1.3 Expected Actions

The Terminology Repository shall process the input parameters to
discover the code in the value set that matches the parameters given and
return a response as per Section 2:3.99.4.2 or an OperationOutcome
Resource with an error message.

#### 2:3.99.4.2 Validate ValueSet Code Response Message

##### 2:3.99.4.2.1 Trigger Events

The Terminology Repository found validation details of the code matching
the input parameters

specified by the Terminology Consumer as a result of a Validate ValueSet
Code Request.

##### 2:3.99.4.2.2 Message Semantics

See [ITI TF-2: Appendix Z.6](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.6-populating-the-expected-response-format) for more details on response format
handling. See [ITI TF-2: Appendix Z.7](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.7-guidance-on-access-denied-results) for handling guidance for Access
Denied.

The response message is a FHIR Parameters Resource with properties of
the code set based on the out parameters defined at
<http://hl7.org/fhir/valueset-operation-validate-code.html> and
reproduced in Table 2:3.99.4.2.2-1.

**Table 2:3.99.4.2.2-1: Validate ValueSet Code Message HTTP Output Parameters**

<table class="grid table-striped">
<thead>
<tr class="header" style="background-color: #e8e8e8;">
<th>Parameter Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>result<br/>[1..1]</td>
<td>boolean</td>
<td>True if the concept details supplied are valid</td>
</tr>
<tr class="even">
<td>message<br/>[0..1]</td>
<td>string</td>
<td>Error details, if result = false. If this is provided when result = true, the message carries hints and warnings</td>
</tr>
<tr class="odd">
<td>display<br/>[0..1]</td>
<td>string</td>
<td>A valid display for the concept if the system wishes to display this to a user</td>
</tr>
</tbody>
</table>

##### 2:3.99.4.2.3 Expected Actions

The Terminology Consumer has received the response and continues with
its workflow.

#### 2:3.99.4.3 Validate CodeSystem Code Request Message

The Validate CodeSystem Code Request message is a FHIR $validate-code
operation on the CodeSystem Resource.

##### 2:3.99.4.3.1 Trigger Events

A Terminology Consumer triggers a Validate CodeSystem Code Request to a
Terminology Repository according to the business rules for the
validation. These business rules are outside the scope of this
transaction.

##### 2:3.99.4.3.2 Message Semantics

A Terminology Consumer initiates an $validate-code request using HTTP
GET as defined at
<http://hl7.org/fhir/codesystem-operation-validate-code.html> on the
CodeSystem Resource. The required input parameters are identified in
Table 2:3.99.4.3.2-1.

The URL for this operation is: `[base]/CodeSystem/$validate-code`

Where \[base\] is the URL of Terminology Repository.

See [ITI TF-2: Appendix W](https://profiles.ihe.net/ITI/TF/Volume2/ch-W.html) for informative implementation material for
this transaction.

**Table 2:3.99.4.3.2-1: Validate CodeSystem Code Message HTTP Input Parameters**

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
<tr class="odd">
<td>url<br/>[0..1]</td>
<td>[1..1]</td>
<td>uri</td>
<td>CodeSystem URL. The server must know the code system (e.g., it is defined explicitly in the server's code systems, or it is known implicitly by the server.</td>
</tr>
<tr class="even">
<td>code<br/>[0..1]</td>
<td>[1..1]</td>
<td>code</td>
<td>The code that is to be validated.</td>
</tr>
<tr class="odd">
<td>_format<br/>[0..1]</td>
<td></td>
<td>mime-type</td>
<td>The requested format of the response from the mime-type value set. See [ITI TF-2: Appendix Z.6](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.6-populating-the-expected-response-format).</td>
</tr>
<tr class="even">
<td>codeSystem<br/>[0..1]</td>
<td>[0..0]<br/>
This parameter is not allowed when the url parameter is used.</td>
<td>CodeSystem</td>
<td></td>
</tr>
<tr class="odd">
<td>version<br/>[0..1]</td>
<td></td>
<td>string</td>
<td>The version of the code system, if one was provided in the source data.</td>
</tr>
<tr class="even">
<td>display<br/>[0..1]</td>
<td></td>
<td>string</td>
<td>The display associated with the code, if provided. If a display is provided a code must be provided. If no display is provided, the server cannot validate the display value, but may choose to return a recommended display name in an extension in the outcome. Whether displays are case sensitive is code system dependent.</td>
</tr>
<tr class="odd">
<td>coding<br/>[0..1]</td>
<td>[0..0]<br/>
This parameter is not allowed when the code+url parameters are used.</td>
<td>Coding</td>
<td></td>
</tr>
<tr class="even">
<td>codeableConcept<br/>[0..1]</td>
<td>[0..0]<br/>
This parameter is not allowed when the code+url parameters are used.</td>
<td>CodeableConcept</td>
<td></td>
</tr>
<tr class="odd">
<td>date<br/>[0..1]</td>
<td></td>
<td>dateTime</td>
<td>The date for which the validation should be checked. Normally, this is the current conditions (which is the default values) but under some circumstances, systems need to validate that a correct code was used at some point in the past. A typical example of this would be where code selection is constrained to the set of codes that were available when the patient was treated, not when the record is being edited. Note that which date is appropriate is a matter for implementation policy.</td>
</tr>
<tr class="even">
<td>abstract<br/>[0..1]</td>
<td></td>
<td>boolean</td>
<td>If this parameter has a value of true, the client is stating that the validation is being performed in a context where a concept designated as 'abstract' is appropriate/allowed to be used, and the server should regard abstract codes as valid. If this parameter is false, abstract codes are not considered to be valid.</td>
</tr>
<tr class="odd">
<td>displayLanguage<br/>[0..1]</td>
<td></td>
<td>code</td>
<td>Specifies the language to be used for description when validating the display property</td>
</tr>
</tbody>
</table>

##### 2:3.99.4.3.3 Expected Actions

The Terminology Repository shall process the input parameters to
discover the code in the code system that matches the parameters given
and return a response as per Section 2:3.99.4.4 or an OperationOutcome
Resource with an error message.

#### 2:3.99.4.4 Validate CodeSystem Code Response Message

##### 2:3.99.4.4.1 Trigger Events

The Terminology Repository found validation details of the code matching
the input parameters

specified by the Terminology Consumer as a result of a Validate
CodeSystem Code Request.

##### 2:3.99.4.4.2 Message Semantics

See [ITI TF-2: Appendix Z.6](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.6-populating-the-expected-response-format) for more details on response format
handling. See [ITI TF-2: Appendix Z.7](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.7-guidance-on-access-denied-results) for handling guidance for Access
Denied.

The response message is a FHIR Parameters Resource with properties of
the code set based on the out parameters defined at
<http://hl7.org/fhir/codesystem-operation-validate-code.html> and
reproduced in Table 2:3.99.4.4.2-1.

**Table 2:3.99.4.4.2-1: Validate CodeSystem Code Message HTTP Output Parameters**

<table class="grid table-striped">
<thead>
<tr class="header" style="background-color: #e8e8e8;">
<th>Parameter Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>result<br/>[1..1]</td>
<td>boolean</td>
<td>True if the concept details supplied are valid</td>
</tr>
<tr class="even">
<td>message<br/>[0..1]</td>
<td>string</td>
<td>Error details, if result = false. If this is provided when result = true, the message carries hints and warnings</td>
</tr>
<tr class="odd">
<td>display<br/>[0..1]</td>
<td>string</td>
<td>A valid display for the concept if the system wishes to display this to a user</td>
</tr>
</tbody>
</table>

##### 2:3.99.4.4.3 Expected Actions

The Terminology Consumer has received the response and continues with
its workflow.

### 2:3.99.5 Security Considerations

See the general Security Consideration in [ITI TF-1: 51.5](volume-1.html#1515-svcm-security-considerations).