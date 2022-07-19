# 1:51 Sharing Valuesets, Codes, and Maps (SVCM)

The Sharing Valuesets, Codes, and Maps (SVCM) Profile defines a
lightweight interface through which healthcare systems may retrieve
centrally managed uniform nomenclature and mappings between code
systems, using the HL7 Fast Healthcare Interoperability Resources
(FHIR) specification.

Terminologies managed in value sets are most useful when they are
widely shared and standardized across geography and disciplines to add
clarity and specificity.

## 1:51.1 SVCM Actors/Transactions

This section defines the actors and transactions in this profile.
General definitions of actors are given in the Technical Frameworks
General Introduction Appendix A at
[http://ihe.net/Technical\_Frameworks](http://ihe.net/Technical_Frameworks/).

Figure 1:51.1-1 shows the actors directly involved in the SVCM Profile and
the relevant transactions between them. Other actors that may be
indirectly involved due to their participation in related profiles are
not necessarily shown.

<div style="border: thin solid black;">
{%include ActorsAndTransactions.svg%}
</div>
<div style="clear: left;"></div>
<div style="border: thin solid black;">
{%include ActorsAndTransactionsSwim.svg%}
</div>
<div style="clear: left;"></div>
<div style="border: thin solid black;">
{%include ActorsAndTransactionsMultiple.svg%}
</div>
<div style="clear: left;"></div>
<div style="border: thin solid black;">
{%include ActorsAndTransactionsTall.svg%}
</div>
<div style="clear: left;"></div>
<div style="border: thin solid black;">
<img alt="" src="ActorsAndTransactionsDiagram.png">
</div>
<div style="clear: left;"></div>
**Figure 1:51.1-1: Actors and Transactions**

Table 1:51.1-1 SVCM Integration Profile - Actors and Transactions lists
the transactions for each actor directly involved in the SVCM Profile.
In order to claim support of this Integration Profile, an implementation
must perform the required transactions (labeled “R”). Transactions
labeled “O” are optional. A complete list of options defined by this
Integration Profile is shown in Table 1:51.2-1.

**Table 1:51.1-1: SVCM Integration Profile - Actors and Transactions**

| Actors                 | Transactions                  | Initiator or Responder | Optionality    | Section          |
| ---------------------- | ----------------------------- | ---------------------- | -------------- | ---------------- |
| Terminology Consumer   | Query Value Set \[ITI-95\]    | Initiator              | O (Note 1)     | [ITI TF-2: 3.95](ITI-95.html)  |
|                        | Query Code System \[ITI-96\]  | Initiator              | O (Note 1)     | [ITI TF-2: 3.96](ITI-96.html)  |
|                        | Expand Value Set \[ITI-97\]   | Initiator              | O (Note 1)     | [ITI TF-2: 3.97](ITI-97.html)  |
|                        | Lookup Code \[ITI-98\]        | Initiator              | O (Note 1)     | [ITI TF-2: 3.98](ITI-98.html)  |
|                        | Validate Code \[ITI-99\]      | Initiator              | O (Note 1)     | [ITI TF-2: 3.99](ITI-99.html)  |
|                        | Query Concept Map \[ITI-100\] | Initiator              | O              | [ITI TF-2: 3.100](ITI-100.html) |
|                        | Translate Code \[ITI-101\]    | Initiator              | O              | [ITI TF-2: 3.101](ITI-101.html) |
| Terminology Repository | Query Value Set \[ITI-95\]    | Responder              | R              | [ITI TF-2: 3.95](ITI-95.html)  |
|                        | Query Code system \[ITI-96\]  | Responder              | R              | [ITI TF-2: 3.96](ITI-96.html)  |
|                        | Expand Value Set \[ITI-97\]   | Responder              | R              | [ITI TF-2: 3.97](ITI-97.html)  |
|                        | Lookup Code \[ITI-98\]        | Responder              | R              | [ITI TF-2: 3.98](ITI-98.html)  |
|                        | Validate Code \[ITI-99\]      | Responder              | R              | [ITI TF-2: 3.99](ITI-99.html)  |
|                        | Query Concept Map \[ITI-100\] | Responder              | O              | [ITI TF-2: 3.100](ITI-100.html) |
|                        | Translate Code \[ITI-101\]    | Responder              | O              | [ITI TF-2: 3.101](ITI-101.html) |
{:.grid .table-striped}

**Note 1**: *A Terminology Consumer shall support at least one of these
transactions.*

### 1:51.1.1 Actor Descriptions and Actor Profile Requirements

Most requirements are documented in ITI TF-2 Transactions. This section
documents any additional requirements on profile’s actors.

In addition to an IHE Integration Statement, the Terminology Consumer
and Terminology Responder shall provide a CapabilityStatement Resource
as described in ITI TF-2x: Appendix Z.4 indicating the capabilities
defined for all the transactions implemented including all query
parameters implemented.

## 1:51.2 SVCM Actor Options

Options that may be selected for this Integration Profile are listed in
**Table 1:51.2-1 Sharing Value Sets - Actors and Option,** along with the
actors to which they apply. Dependencies between options, when
applicable, are specified in notes.

**Table 1:51.2-1: Sharing Value Sets - Actors and Options**

| Actor                  | Options          | Vol. & Section |
| ---------------------- | ---------------- | -------------- |
| Terminology Consumer   | Translate Option | [Section 1:51.2.1](#15121-translate-option) |
| Terminology Repository | Translate Option | [Section 1:51.2.1](#15121-translate-option) |
{:.grid .table-striped}

### 1:51.2.1 Translate Option

The translate option enables querying for Concept Maps and translating
codes.

A Terminology Consumer or Terminology Repository that supports the
Translate Option shall support the [Query Concept Map \[ITI-100\]](ITI-100.html) and
[Translate Code \[ITI-101\]](ITI-101.html) transactions. See [ITI TF-2: 3.100](ITI-100.html) and 
[ITI TF-2: 3.101](ITI-101.html).

## 1:51.3 SVCM Required Actor Groupings

An actor from this profile (Column 1) shall implement all of the
required transactions and/or content modules in this profile ***in
addition to <span class="underline">all</span>*** of the
requirements for the grouped actor (Column 2).

**Table 1:51.3-1: SVCM Profile - Required Actor Groupings**

| SVCM Actor             | Actor(s) to be grouped with              | Reference   | Content Bindings Reference |
| ---------------------- | ---------------------------------------- | ----------- | -------------------------- |
| Terminology Consumer   | None                                     | --         | --                        |
| Terminology Repository | ATNA / Secure Node or Secure Application | [ITI TF-1: 9](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html) | --                        |
{:.grid .table-striped}

## 1:51.4 SVCM Overview

### 1:51.4.1 Concepts

#### 1:51.4.1.1 Definitions

The FHIR terminology specification defines the following terms, see
<http://hl7.org/fhir/R4/terminology-module.html>:

- **Concept** – A code and definition. A representation of a real or
abstract thing, which provides meaning.

- **Code System** - Define concepts and give them meaning through
formal definitions, and assign codes that represent the concepts.
Examples of code systems include ICD-10, LOINC, SNOMED-CT, and
RxNorm. See <https://hl7.org/fhir/R4/terminologies-systems.html>.

- **Value Set** - Specifies a set of codes defined by code systems
that can be used in a specific context. Value sets link code system
definitions and their use in coded elements. See <https://hl7.org/fhir/R4/terminologies-valuesets.html>.

- **Concept Map** - Defines a mapping from a set of concepts defined
in a code system to one or more concepts defined in other code
systems. See <http://hl7.org/fhir/R4/conceptmap.html>
and <http://www.hl7.org/documentcenter/public/standards/V3/core_principles/infrastructure/coreprinciples/v3modelcoreprinciples.html#gl-concept>.

- **Value Set Expansion** - Converts a Value Set to a list of concept
representations at a point in time, which typically consists of
codes. Good practice is that a system that captures a coded value
should be capable of reconstructing the Value Set Expansion in
effect when a given code was selected. See <http://www.hl7.org/documentcenter/public/standards/V3/core_principles/infrastructure/coreprinciples/v3modelcoreprinciples.html#coreP_Coded_Properties-value-sets-resolution>.

#### 1:51.4.1.2 Business Identifiers

Some value sets, code systems, and concept maps have business identifiers, e.g., OIDs.  See Section 
[ITI TF-2: Z.9.1](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.9.1-identifier-type).  In SVCM,
these business identifiers should be stored in the `.identifier` element.  The FHIR specification strongly
recommends using an http URL in the `.url` element, but if this is not possible, then the `.url` element
can contain a URI, for example, an OID as urn:oid:X.X.X.

Recommended Example:

```
  "url" : "http://example.org/fhir/ValueSet/example",
  "identifier" : [{
    "system" : "urn:ietf:rfc:3986",
    "value" : "urn:oid:1.2.3.4.5.6.7.8.9"
  }],
```

Or if not possible:

```
  "url" : "urn:oid:1.2.3.4.5.6.7.8.9",
  "identifier" : [{
    "system" : "urn:ietf:rfc:3986",
    "value" : "urn:oid:1.2.3.4.5.6.7.8.9"
  }],
```

### 1:51.4.2 Use Cases

The following use cases provide examples of how this profile might be
used by various disciplines.

#### 1:51.4.2.1 Use Case \#1 - Code System, Value Set, and Concept Map Discovery

In this use case, a Terminology Consumer retrieves and filters a list of
Code Systems, Value Sets, or Concept Maps available in a Terminology
Repository.

##### 1:51.4.2.1.1 Code System or Value Set Discovery Use Case Description

A Terminology Consumer requires a method for querying a Terminology
Repository for a list of available Value Sets, Code Systems, and Concept
Maps, based on filter criteria. Periodically, a health care organization
publishes updated Value Sets, Code Systems, and Concept Maps documenting
the codes that point of service systems must use. An electronic medical
record system, the Terminology Consumer, periodically retrieves the list
of available Value Sets, Code Systems, and Concept Maps that are
relevant to its care unit and verifies that it has an up-to-date version
of each cached locally.

<div>
{%include usecase1-processflow.svg%}
</div>
<div style="clear: left;"></div>
**Figure 1:51.4.2.1.1-1: Discovery interaction diagram**

#### 1:51.4.2.2 Use Case \#2 - Expand a Value Set

In this use case, a point of service system is providing a list of codes
to provide decision support to a clinician prescribing medications.

##### 1:51.4.2.2.1 Expand a Value Set Use Case Description

A clinician uses a computerized physician order entry (CPOE) system to
order opioid medications for an inpatient. A value set containing all of
the opiate medication formulations that are considered to have abuse
potential can be pulled to support clinical decision support in a health
record system. Using a pre-assigned identifier, the CPOE system queries
the Terminology Repository for an "expanded" Value Set to retrieve the
list of codes based on the definition of the Value Set. The codes
returned by an “expand” operation are suitable for providing decision
support and validation.

<div>
{%include usecase2-processflow.svg%}
</div>
<div style="clear: left;"></div>
**Figure 1:51.4.2.2.1-1: Expand a Value Set Use Case Diagram**

#### 1:51.4.2.3 Use Case \#3 - Look up a code

In this use case, a Terminology Consumer asks a Terminology Repository
for details about a particular code system/code combination.

##### 1:51.4.2.3.1 Look up a code Use Case Description

A physician updates a patient’s problems list (conditions) at a point of
service terminal. After a code is entered, the point of service
terminal—the Terminology Consumer—queries a Terminology Repository to
retrieve the full details of the code using the lookup operation. The
Terminology Repository returns information for both display and
processing purposes, such as a longer narrative description along with
inclusions and exclusions, allowing the physician to verify that she
entered the correct code and to make a correction if necessary.

<div>
{%include usecase3-processflow.svg%}
</div>
<div style="clear: left;"></div>
**Figure 1:51.4.2.3.1-1: Look up a Concept Use Case Diagram**

#### 1:51.4.2.4 Use Case \#4 - Validate a code

In this use case, a point of service system verifies whether a code is a
valid member of a value set.

##### 1:51.4.2.4.1 Validate a code Use Case Description

A health system publishes value sets consisting of codes relevant to
particular clinical contexts and related procedures. Value sets are
updated periodically to represent changes in clinical practice and
available medicines and supplies. Before submitting an update to a
patient record, an electronic medical record system checks a code
through the Terminology Repository to validate each medical code. The
Terminology Repository returns true/false indicating whether a
code/concept is in the set of codes associated with a value set.

<div>
{%include usecase4-processflow.svg%}
</div>
<div style="clear: left;"></div>
**Figure 1:51.4.2.4.1-1: Validate a Code Use Case Diagram**

#### 1:51.4.2.5 Use Case \#5 - Translate a code

In this use case, a concept is translated from a source code system,
possibly a proprietary local terminology, to a target code system, such
as LOINC.

##### 1:51.4.2.5.1 Translate a Code Use Case Description

In this example, an ambulatory clinic might refer to a lab test as a
“white count”. To report and analyze these tests accurately, the
clinic must submit its data using a shared terminology standard used
within the health system, such as LOINC. The clinic’s reporting system
queries a Terminology Repository to translate its local “white count”
concept to a LOINC concept using a pre-loaded Concept Map, which defines
relationships between concepts in a source Code System and one or more
target Code Systems. The Terminology Repository returns LOINC 6690-2
“Leukocytes \[\#/volume\] in Blood by Automated count”.

<div>
{%include usecase5-processflow.svg%}
</div>
<div style="clear: left;"></div>
**Figure 1:51.4.2.5.1-1: Translate a Code Use Case Diagram**

## 1:51.5 SVCM Security Considerations

The contents handled by the SVCM Profile are not patient-specific, so
there are no risks to patient privacy. Some Expanded Value Sets are of
little value to an attacker as they are public tables of non-critical
information (e.g., Expanded Value Sets used for coding of body parts in
medical exams). Other Expanded Value Sets might need protection against
malicious modification or interception. For example, there can be
integrity risks such as masquerade, or the modification of Expanded
Value Sets. Another possible type of risk would be at the privacy and
confidentiality level, such as the interception of an Expanded Value Set
containing confidential data. The profile will allow mitigation of those
risks when needed in the following manner:

- A Terminology Repository shall be grouped with an ATNA Secure Node
or Secure Application. Since the Terminology Consumer is not
required to be grouped with the Secure Node or Secure Application,
the Terminology Repository shall support both secure and non-secure
connections.

- Terminology Repositories shall be able to restrict access to a
specific Expanded Value Set to authorized and authenticated nodes,
while allowing unauthenticated network queries to other Expanded
Value Sets.

See [ITI TF-2: Appendix Z.8 “Mobile Security Considerations”](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.8.1-auditing-considerations).

## 1:51.6 SVCM Cross Profile Considerations

### 1:51.6.1 Sharing Value Sets (SVS)

When an SVCM Terminology Repository is grouped with an [SVS](https://profiles.ihe.net/ITI/TF/Volume1/ch-21.html) Value Set Repository, then it
should ensure the business identifiers are aligned. SVS uses OIDs as value set ids. SVCM stores
these in the ValueSet.identifier element. See Section [51.4.1.2](#151412-business-identifiers).