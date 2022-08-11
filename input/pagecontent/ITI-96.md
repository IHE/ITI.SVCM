This section corresponds to transaction \[ITI-96\] of the IHE IT
Infrastructure Technical Framework. Transaction \[ITI-96\] is used by
the Terminology Consumer and Terminology Repository Actors.

### 2:3.96.1 Scope

This transaction is used by the Terminology Consumer to solicit
information about code systems whose data match data provided in the
query parameters on the request message. The request is received by the
Terminology Repository. The Terminology Repository processes the request
and returns a response of the matching code systems.

### 2:3.96.2 Actor Roles

**Table 2:3.96.2-1: Actor Roles**

| ---------- | -------------------------------------------------------------------------------------------------- |
| **Actor:** | Terminology Consumer                                                                               |
| **Role:**  | Requests code system(s) matching the supplied set of criteria from the Terminology Repository.     |
| **Actor:** | Terminology Repository                                                                             |
| **Role:**  | Returns information for code system(s) matching the criteria provided by the Terminology Consumer. |
{:.grid .table-striped}
### 2:3.96.3 Referenced Standards

- HL7 FHIR standard R4 <http://hl7.org/fhir/R4/index.html>

### 2:3.96.4 Messages

<div>
{%include ITI-96-seq.svg%}
</div>
<div style="clear: left;"></div>
**Figure 2:3.96.4-1: Interaction Diagram**

#### 2:3.96.4.1 Search Code System Request Message

The Search Code System message is a FHIR search interaction on the
CodeSystem Resource.

##### 2:3.96.4.1.1 Trigger Events

A Terminology Consumer triggers a Search Code System Request to a
Terminology Repository according to the business rules for the search.
These business rules are outside the scope of this transaction.

##### 2:3.96.4.1.2 Message Semantics

A Terminology Consumer initiates a search interaction using HTTP GET as
defined at <http://hl7.org/fhir/R4/http.html#search> on the CodeSystem.
The query parameters are identified below. A Terminology Consumer may
query any combination or subset of the parameters. The target is
formatted as:

```
GET [base]/CodeSystem?[parameter=value]
```

Where \[base\] is the URL of Terminology Repository.

A Terminology Repository shall support responding to a request for both
the JSON and the XML messaging formats as defined in FHIR. A Terminology
Consumer shall accept either the JSON or the XML messaging formats as
defined in FHIR. See [ITI TF-2: Appendix Z.6](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.6-populating-the-expected-response-format) for more details.

A Terminology Repository shall implement the parameters described below.
A Terminology Repository may choose to support additional query
parameters beyond the subset listed below. Any additional query
parameters supported shall be supported according to the core FHIR
specification.

See [ITI TF-2: Appendix W](https://profiles.ihe.net/ITI/TF/Volume2/ch-W.html) for informative implementation material for
this transaction.

###### 2:3.96.4.1.2.1 Query Parameters

The Terminology Repository shall support the :contains and :exact
modifiers in all of the string query parameters below defined at
<http://hl7.org/fhir/R4/search.html#string>.

The Terminology Repository shall support the following search parameters
as defined at <http://hl7.org/fhir/R4/search.html#all> and
<http://hl7.org/fhir/R4/codesystem.html#search>.

```
_id
_lastUpdated
status
identifier
name
description
system
title
url
version
```

The Terminology Repository shall also support the following prefixes for
the `_lastUpdated` parameter: `gt`, `lt`, `ge`, `le`, `sa`, and `eb`.

##### 2:3.96.4.1.3 Expected Actions

The Terminology Repository shall process the query to discover the code
systems that match the search parameters given, and return a response as
per Section 2:3.96.4.2 or an error as per
<http://hl7.org/fhir/R4/search.html#errors>.

#### 2:3.96.4.2 Search Code System Response Message

##### 2:3.96.4.2.1 Trigger Events

The Terminology Repository found code systems matching the query
parameters specified by the Terminology Consumer as a result of a Search Code
System Request.

##### 2:3.96.4.2.2 Message Semantics

The Terminology Repository shall support the search response message as
defined at <http://hl7.org/fhir/R4/http.html#search> on the CodeSystem,
as defined at <http://hl7.org/fhir/R4/codesystem.html>.

The “content-type” of the response will depend upon the requested
response format indicated by the Terminology Consumer.

See [ITI TF-2: Appendix Z.6](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.6-populating-the-expected-response-format) for more details on response format
handling. See [ITI TF-2: Appendix Z.7](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.7-guidance-on-access-denied-results) for handling guidance for Access
Denied.

###### 2:3.96.4.2.2.1 FHIR CodeSystem Resource Constraints

A CodeSystem Resource returned by the Terminology Repository shall be further constrained as described in the [CodeSystem Profile for SVCM](StructureDefinition-IHE.SVCM.CodeSystem.html).

##### 2:3.96.4.2.3 Expected Actions

The Terminology Consumer has received the response and continues with
its workflow.

#### 2:3.96.4.3 Read Code System Request Message

This message represents an HTTP GET from the Terminology Consumer to the
Terminology Repository and provides a mechanism for retrieving a single
CodeSystem with a known resource id.

##### 2:3.96.4.3.1 Trigger Events

When the Terminology Consumer possesses the id of the CodeSystem (either
through query, database lookup, or other mechanism) for which it
requires additional or new information, it issues a Read Code System
Request.

##### 2:3.96.4.3.2 Message Semantics

A Terminology Consumer initiates a read interaction using HTTP GET as
defined at <http://hl7.org/fhir/R4/http.html#read> on the CodeSystem
Resource. The target is formatted as:

```
GET [base]/CodeSystem/[resourceId]
```

Where \[base\] is the URL of Terminology Repository.

The resourceId included in the request always represents the unique id
for the CodeSystem within the scope of the URL. For example, while
http://example1.org/ihe/CodeSystem/1 and
http://example2.com/ihe/CodeSystem/1 both contain the same
\[resourceId\], they reference two different resource instances.

*Note: The use of "http" or "https" in URL does not override requirements
to use TLS for security purposes.*

A Terminology Repository shall support responding to a request for both
the JSON and the XML messaging formats as defined in FHIR. A Terminology
Consumer shall accept either the JSON or the XML messaging formats as
defined in FHIR. See [ITI TF-2: Appendix Z.6](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.6-populating-the-expected-response-format) for more details.

See [ITI TF-2: Appendix W](https://profiles.ihe.net/ITI/TF/Volume2/ch-W.html) for informative implementation material for
this transaction.

##### 2:3.96.4.3.3 Expected Actions

The Terminology Repository shall process the request to retrieve the
CodeSystem that matches the given resource id, and return a response as
defined at <http://hl7.org/fhir/R4/http.html#read> or an error code as
defined at <http://hl7.org/fhir/http.html#Status-Codes>.

#### 2:3.96.4.4 Read Code System Response Message

The Terminology Repository’s response to a successful Read Code System
message shall be an **HTTP 200** (OK) Status code with a CodeSystem
Resource, or an appropriate error status code, optionally with an
OperationOutcome Resource.

##### 2:3.96.4.4.1 Trigger Events

The Terminology Repository found a CodeSystem Resource matching the
resource identifier specified by the Terminology Consumer.

##### 2:3.96.4.4.2 Message Semantics

The Read Code System Response is sent from the Terminology Repository to
the Terminology Consumer as a single CodeSystem, as defined at
<http://hl7.org/fhir/R4/codesystem.html> and constrained by the [CodeSystem Profile for SVCM](StructureDefinition-IHE.SVCM.CodeSystem.html).

The “content-type” of the response will depend upon the requested
response format indicated by the Terminology Consumer.

See [ITI TF-2: Appendix Z.6](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.6-populating-the-expected-response-format) for more details on response format
handling. See [ITI TF-2: Appendix Z.7](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.7-guidance-on-access-denied-results) for handling guidance for Access
Denied.

If the Terminology Repository is unable to produce a response in the
requested format, it shall respond with an **HTTP 4xx** error indicating
that it was unable to fulfill the request. The Terminology Repository
may be capable of servicing requests for response formats not listed,
but shall, at minimum, be capable of producing XML and JSON encodings.

##### 2:3.96.4.4.3 Expected Actions

The Terminology Consumer has received the response and continues with
its workflow.

### 2:3.96.5 Security Considerations

See the general Security Consideration in [ITI TF-1: 51.5](volume-1.html#1515-svcm-security-considerations).

#### 2:3.96.5.1 Security Audit Considerations

Note that the same audit message is recorded by both Terminology Consumer and Repository. The
difference being the Audit Source element. Both sides record to show consistency
between the message sent by the Consumer and the action taken at the Registry.

The actors involved shall record audit events according to the
[Audit Event for Query Code System for Read by the Terminology Consumer and Repository](StructureDefinition-IHE.SVCM.Audit.CodeSystem.Read.html)
or the [Audit Event for Query Code System for Query by the Terminology Consumer and Repository](StructureDefinition-IHE.SVCM.Audit.CodeSystem.Query.html).
