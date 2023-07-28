
The Sharing Valuesets, Codes, and Maps (SVCM) Profile defines a
lightweight interface through which healthcare systems may retrieve
centrally managed uniform nomenclature and mappings between code systems
based on the HL7 Fast Healthcare Interoperability Resources (FHIR)
specification.

<div markdown="1" class="stu-note">

| [Significant Changes, Open, and Closed Issues](issues.html) |
{: .grid}

</div>

### Organization of This Guide
This guide is organized into four main sections:

- Volume 1: Profiles
  - [Overview](volume-1.html)
  - [Actors and Transactions](volume-1.html#1511-svcm-actors-transactions-and-content-modules)
  - [Actor Options](volume-1.html#1512-svcm-actor-options)
  - [Actor Required Groupings](volume-1.html#1513-svcm-required-actor-groupings)
  - [Overview](volume-1.html#1514-svcm-overview)
  - [Security Considerations](volume-1.html#1515-svcm-security-considerations)
  - [Cross Profile Considerations](volume-1.html#1516-svcm-cross-profile-considerations)
- Volume 2: Transaction Detail
  - [Query Value Set \[ITI-95\]](ITI-95.html)
  - [Query Code System \[ITI-96\]](ITI-96.html)
  - [Expand Value Set \[ITI-97\]](ITI-97.html)
  - [Lookup Code \[ITI-98\]](ITI-98.html)
  - [Validate Code \[ITI-99\]](ITI-99.html)
  - [Query Concept Map \[ITI-100\]](ITI-100.html)
  - [Translate Code \[ITI-101\]](ITI-101.html)
- [Test Plan](testplan.html)
- [Changes to Other Profiles](other.html)
- [Download and Analysis](download.html)

Click on any of the links above, navigate the contents using the [table of contents](toc.html), or if you are looking for a specific artifact, see the index of [artifacts](artifacts.html) defined as part of this implementation guide.

### Conformance Expectations

IHE uses the normative words Shall, Should, and May according to [standards conventions](https://profiles.ihe.net/GeneralIntro/ch-E.html).

#### Must Support

The use of ```mustSupport``` in StructureDefinition profiles equivalent to the IHE use of **R2** as defined in [Appendix Z](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.10-profiling-conventions-for-constraints-on-fhir).

mustSupport of true - only has a meaning on items that are minimal cardinality of zero (0), and applies only to the source actor populating the data. The source actor shall populate the elements marked with MustSupport, if the concept is supported by the actor, a value exists, and security and consent rules permit. 
The consuming actors should handle these elements being populated or being absent/empty. 
Note that sometimes mustSupport will appear on elements with a minimal cardinality greater than zero (0), this is due to inheritance from a less constrained profile.
