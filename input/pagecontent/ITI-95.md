This section corresponds to transaction \[ITI-95\] of the IHE IT
Infrastructure Technical Framework. Transaction \[ITI-95\] is used by
the Terminology Consumer and Terminology Repository Actors.

### 3.95.1 Scope

This transaction is used by the Terminology Consumer to find value sets
based on criteria it provides in the query parameters of the request
message, or to retrieve a specific value set. The request is received by
the Terminology Repository. The Terminology Repository processes the
request and returns a response of the matching value sets.

### 3.95.2 Actor Roles

**Table 3.95.2-1: Actor Roles**

| ---------- | ------------------------------------------------------------------------------------------------ |
| **Actor:** | Terminology Consumer                                                                             |
| **Role:**  | Requests value set(s) matching the supplied set of criteria from the Terminology Repository.     |
| **Actor:** | Terminology Repository                                                                           |
| **Role:**  | Returns information for value set(s) matching the criteria provided by the Terminology Consumer. |
{:.grid .table-striped}

### 3.95.3 Referenced Standards

- HL7 FHIR standard R4 <http://hl7.org/fhir/R4/index.html>

### 3.95.4 Messages

<div>
{%include ITI-95-seq.svg%}
</div>
<div style="clear: left;"></div>
**Figure 3.95.4-1: Interaction Diagram**

#### 3.95.4.1 Search Value Set Request Message

The Search Value Set message is a FHIR search interaction on the
ValueSet Resource.

##### 3.95.4.1.1 Trigger Events

A Terminology Consumer triggers a Search Value Set Request to a
Terminology Repository according to the business rules for the search.
These business rules are outside the scope of this transaction.

##### 3.95.4.1.2 Message Semantics

A Terminology Consumer initiates a search interaction using HTTP GET as
defined at <http://hl7.org/fhir/R4/http.html#search> on the ValueSet.
The query parameters are identified below. A Terminology Consumer may
query any combination or subset of the parameters. The target is
formatted as:

```
GET [base]/ValueSet?[parameter=value]
```
Where \[base\] is the URL of Terminology Repository.

A Terminology Repository shall support combinations of search parameters
as defined at <http://hl7.org/fhir/R4/search.html#combining>, “Composite
Search Parameters.”

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

###### 3.95.4.1.2.1 Query Parameters

The Terminology Repository shall support the :contains and :exact
modifiers in all of the string query parameters below defined at
<http://hl7.org/fhir/R4/search.html#string>.

The Terminology Repository shall support the following search parameters
as defined at <http://hl7.org/fhir/R4/search.html#all> and
<http://hl7.org/fhir/R4/valueset.html#search>.

```
_id
_lastUpdated
status
identifier
name
description
reference
title
url
version
```

The Terminology Repository shall also support the following prefixes for
the `_lastUpdated` parameter: `gt`, `lt`, `ge`, `le`, `sa`, and `eb`.

##### 3.95.4.1.3 Expected Actions

The Terminology Repository shall process the query to discover the value
sets that match the search parameters given, and return a response as
per Section 3.95.4.2 or an error as per
<http://hl7.org/fhir/R4/search.html#errors>.

#### 3.95.4.2 Search Value Set Response Message

##### 3.95.4.2.1 Trigger Events

The Terminology Repository found value sets matching the query
parameters specified by the Terminology Consumer as a result of a Search
Value Set Request.

##### 3.95.4.2.2 Message Semantics

The Terminology Repository shall support the search response message as
defined at <http://hl7.org/fhir/R4/http.html#search> on the ValueSet, as
defined at <http://hl7.org/fhir/R4/valueset.html>

The “content-type” of the response will depend upon the requested
response format indicated by the Terminology Consumer.

See [ITI TF-2: Appendix Z.6](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.6-populating-the-expected-response-format) for more details on response format
handling. See [ITI TF-2: Appendix Z.7](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.7-guidance-on-access-denied-results) for handling guidance for Access
Denied.

##### 3.95.4.2.3 Expected Actions

The Terminology Consumer has received the response and continues with
its workflow.

#### 3.95.4.3 Read Value Set Request Message

This message represents an HTTP GET from the Terminology Consumer to the
Terminology Repository and provides a mechanism for retrieving a single
ValueSet with a known resource id.

##### 3.95.4.3.1 Trigger Events

When the Terminology Consumer possesses the id of ValueSet (either
through query, database lookup, or other mechanism) for which it
requires additional or new information, it issues a Read Value Set
Request.

##### 3.95.4.3.2 Message Semantics

A Terminology Consumer initiates a read interaction using HTTP GET as
defined at <http://hl7.org/fhir/R4/http.html#read> on the ValueSet
Resource. The target is formatted as:

```
GET [base]/ValueSet/[resourceId]
```

Where \[base\] is the URL of Terminology Repository.

The resourceId included in the request always represents the unique id
for the ValueSet within the scope of the URL. For example, while
http://example1.org/ihe/ValueSet/1 and
http://example2.com/ihe/ValueSet/1 both contain the same \[resourceId\],
they reference two different resource instances.

Note: The use of "http" or "https" in URL does not override requirements
to use TLS for security purposes.

A Terminology Repository shall support responding to a request for both
the JSON and the XML messaging formats as defined in FHIR. A Terminology
Consumer shall accept either the JSON or the XML messaging formats as
defined in FHIR. See [ITI TF-2: Appendix Z.6](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.6-populating-the-expected-response-format) for more details.

See [ITI TF-2: Appendix W](https://profiles.ihe.net/ITI/TF/Volume2/ch-W.html) for informative implementation material for
this transaction.

##### 3.95.4.3.3 Expected Actions

The Terminology Repository shall process the request to retrieve the
ValueSet that matches the given resource id, and return a response as
defined at <http://hl7.org/fhir/R4/http.html#read> or an error code as
defined at <http://hl7.org/fhir/R4/http.html#Status-Codes>.

#### 3.95.4.4 Read Value Set Response Message

The Terminology Repository’s response to a successful Read Value Set
message shall be an **HTTP 200** (OK) Status code with a ValueSet
Resource, or an appropriate error status code, optionally with an
OperationOutcome Resource.

##### 3.95.4.4.1 Trigger Events

The Terminology Repository found a ValueSet Resource matching the
resource identifier specified by the Terminology Consumer.

##### 3.95.4.4.2 Message Semantics

The Read Value Set Response is sent from the Terminology Repository to
the Terminology Consumer as a single ValueSet, as defined at
<http://hl7.org/fhir/R4/valueset.html>.

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

##### 3.95.4.4.3 Expected Actions

The Terminology Consumer has received the response and continues with
its workflow.

### 3.95.5 Security Considerations

See the general Security Consideration in [ITI TF-1: 51.5](volume-1.html#1515-svcm-security-considerations).