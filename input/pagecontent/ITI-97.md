This section corresponds to transaction \[ITI-97\] of the IHE IT
Infrastructure Technical Framework. Transaction \[ITI-97\] is used by
the Terminology Consumer and Terminology Repository Actors.

### 3.97.1 Scope

This transaction is used by the Terminology Consumer to expand a given
ValueSet to return the full list of concepts available in that ValueSet.
The request is received by the Terminology Repository. The Terminology
Repository processes the request and returns a response of the expanded
ValueSet.

### 3.97.2 Actor Roles

**Table 3.97.2-1: Actor Roles**

| ---------- | ----------------------------------------------------------------------------------------------------- |
| **Actor:** | Terminology Consumer                                                                                  |
| **Role:**  | Requests an expanded ValueSet from the Terminology Repository.                                        |
| **Actor:** | Terminology Repository                                                                                |
| **Role:**  | Returns information for the expanded ValueSet based on criteria provided by the Terminology Consumer. |
{:.grid .table-striped}

### 3.97.3 Referenced Standards

- HL7 FHIR standard R4 <http://hl7.org/fhir/R4/index.html>

### 3.97.4 Messages

<div>
{%include ITI-97-seq.svg%}
</div>
<div style="clear: left;"></div>
**Figure 3.97.4-1: Interaction Diagram**

#### 3.97.4.1 Expand Value Set Request Message

The Expand Value Set Request message is a FHIR $expand operation on the
ValueSet Resource.

##### 3.97.4.1.1 Trigger Events

A Terminology Consumer triggers an Expand Value Set Request to a
Terminology Repository according to the business rules for the
expansion. These business rules are outside the scope of this
transaction.

##### 3.97.4.1.2 Message Semantics

A Terminology Consumer initiates an $expand request using HTTP GET as
defined at <http://hl7.org/fhir/R4/valueset-operation-expand.html> on the
ValueSet Resource. The required input parameters are identified in Table
3.97.4.1.2-1.

The URL for this operation is:
```
[base]/ValueSet/$expand?[parameter=value]
```

Where \[base\] is the URL of Terminology Repository.

See [ITI TF-2: Appendix W](https://profiles.ihe.net/ITI/TF/Volume2/ch-W.html) for informative implementation material for
this transaction.

**Table 3.97.4.1.2-1: Expand Value Set Message HTTP Input Parameters**

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
<td>url<br/>
[0..1]</td>
<td>[1..1]</td>
<td>uri</td>
<td>A canonical reference to a value set. The server must know the value set (e.g., it is defined explicitly in the server's value sets, or it is defined implicitly by some code system known to the server).</td>
</tr>
<tr>
<td>_format<br/>
[0..1]</td>
<td></td>
<td>mime-type</td>
<td>The requested format of the response from the mime-type value set. See [ITI TF-2: Appendix Z.6](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.6-populating-the-expected-response-format).</td>
</tr>
<tr>
<td>valueSet<br/>
[0..1]</td>
<td>[0..0]<br/>
This parameter is not allowed when the url is used.</td>
<td>ValueSet</td>
<td></td>
</tr>
<tr>
<td>valueSetVersion<br/>
[0..1]</td>
<td>[0..1]</td>
<td>string</td>
<td>The identifier that is used to identify a specific version of the value set to be used when generating the expansion. This is an arbitrary value managed by the value set author and is not expected to be globally unique. For example, it might be a timestamp (e.g., yyyymmdd) if a managed version is not available.</td>
</tr>
<tr>
<td>context<br/>
[0..1]</td>
<td>[0..0]<br/>
This parameter is not allowed when the url is used.</td>
<td>uri</td>
<td></td>
</tr>
<tr>
<td>contextDirection<br/>
[0..1]</td>
<td>[0..0]<br/>
This parameter is used with the context parameter which is not used.</td>
<td>code</td>
<td></td>
</tr>
<tr>
<td>filter<br/>
[0..1]</td>
<td></td>
<td>string</td>
<td>A text filter that is applied to restrict the codes that are returned (this is useful in a UI context). The interpretation of this is delegated to the server in order to allow to determine the most optimal search approach for the context. The server can document the way this parameter works in TerminologyCapabilities.expansion.textFilter. Typical usage of this parameter includes functionality like:
<ul>
<li>using left matching e.g., "acut ast"</li>
<li>allowing for wild cards such as %, &amp;, ?</li>
<li>searching on definition as well as display(s)</li>
<li>allowing for search conditions (and / or / exclusions)</li>
</ul>
Text Search engines such as Lucene or Solr, long with their considerable functionality, might also be used. The optional text search might also be code system specific, and servers might have different implementations for different code systems.</td>
</tr>
<tr>
<td>date<br/>
[0..1]</td>
<td></td>
<td>dateTime</td>
<td>The date for which the expansion should be generated. if a date is provided, it means that the server should use the value set / code system definitions as they were on the given date, or return an error if this is not possible. Normally, the date is the current conditions (which is the default value) but under some circumstances, systems need to generate an expansion as it would have been in the past. A typical example of this would be where code selection is constrained to the set of codes that were available when the patient was treated, not when the record is being edited. Note that which date is appropriate is a matter for implementation policy.</td>
</tr>
<tr>
<td>offset<br/>
[0..1]</td>
<td></td>
<td>integer</td>
<td>Paging support - where to start if a subset is desired (default = 0). Offset is number of records (not number of pages)</td>
</tr>
<tr>
<td>count<br/>
[0..1]</td>
<td></td>
<td>integer</td>
<td>Paging support - how many codes should be provided in a partial page view. Paging only applies to flat expansions - servers ignore paging if the expansion is not flat. If count = 0, the client is asking how large the expansion is. Servers SHOULD honor this request for hierarchical expansions as well, and simply return the overall count.</td>
</tr>
<tr>
<td>includeDesignations<br/>
[0..1]</td>
<td></td>
<td>boolean</td>
<td>Controls whether concept designations are to be included or excluded in value set expansions.</td>
</tr>
<tr>
<td>designation<br/>
[0..*]</td>
<td></td>
<td>string</td>
<td>A token that specifies a system+code that is either a use or a language. Designations that match by language or use are included in the expansion. If no designation is specified, it is at the server discretion which designations to return.</td>
</tr>
<tr>
<td>includeDefinition<br/>
[0..1]</td>
<td></td>
<td>boolean</td>
<td>Controls whether the value set definition is included or excluded in value set expansions.</td>
</tr>
<tr>
<td>activeOnly<br/>
[0..1]</td>
<td></td>
<td>boolean</td>
<td>Controls whether inactive concepts are included or excluded in value set expansions. Note that if the value set explicitly specifies that inactive codes are included, this parameter can still remove them from a specific expansion, but this parameter cannot include them if the value set excludes them</td>
</tr>
<tr>
<td>excludeNested<br/>
[0..1]</td>
<td></td>
<td>boolean</td>
<td>Controls whether or not the value set expansion nests codes or not (i.e., ValueSet.expansion.contains.contains)</td>
</tr>
<tr>
<td>excludeNotForUI<br/>
[0..1]</td>
<td></td>
<td>boolean</td>
<td>Controls whether or not the value set expansion is assembled for a user interface use or not. Value sets intended for User Interface might include 'abstract' codes or have nested contains with items with no code or abstract = true, with the sole purpose of helping a user navigate through the list efficiently, where as a value set not generated for UI use might be flat, and only contain the selectable codes in the value set. The exact implications of 'for UI' depend on the code system, and what properties it exposes for a terminology server to use. In the FHIR Specification itself, the value set expansions are generated with excludeNotForUI = false, and the expansions used when generated schema / code etc., or performing validation, are all excludeNotForUI = true.</td>
</tr>
<tr>
<td>excludePostCoordinate<br/>
[0..1]</td>
<td></td>
<td>boolean</td>
<td>Controls whether or not the value set expansion includes post coordinated codes.</td>
</tr>
<tr>
<td>displayLanguage<br/>
[0..1]</td>
<td></td>
<td>code</td>
<td>Specifies the language to be used for description in the expansions i.e., the language to be used for ValueSet.expansion.contains.display.</td>
</tr>
<tr>
<td>exclude-system<br/>
[0..*]</td>
<td></td>
<td>canonical</td>
<td>Code system, or a particular version of a code system to be excluded from the value set expansion. The format is the same as a canonical URL: [system]|[version] - e.g., http://loinc.org|2.56</td>
</tr>
<tr>
<td>system-version<br/>
[0..*]</td>
<td></td>
<td>canonical</td>
<td>Specifies a version to use for a system, if the value set does not specify which one to use. The format is the same as a canonical URL: [system]|[version] - e.g., http://loinc.org|2.56</td>
</tr>
<tr>
<td>check-system-version<br/>
[0..*]</td>
<td></td>
<td>canonical</td>
<td>Edge Case: Specifies a version to use for a system. If a value set specifies a different version, an error is returned instead of the expansion. The format is the same as a canonical URL: [system]|[version] - e.g., http://loinc.org|2.56</td>
</tr>
<tr>
<td>force-system-version<br/>
[0..*]</td>
<td></td>
<td>canonical</td>
<td>Edge Case: Specifies a version to use for a system. This parameter overrides any specified version in the value set (and any it depends on). The format is the same as a canonical URL: [system]|[version] - e.g., http://loinc.org|2.56. Note that this has obvious safety issues, in that it may result in a value set expansion giving a different list of codes that is both wrong and unsafe, and implementers should only use this capability reluctantly. It primarily exists to deal with situations where specifications have fallen into decay as time passes. If the value is override, the version used SHALL explicitly be represented in the expansion parameters.</td>
</tr>
</tbody>
</table>

###### 3.97.4.1.2.1 Example Request Message

An example request message from
<http://hl7.org/fhir/valueset-operation-expand.html> is:

```
GET [base]/ValueSet/$expand?url=http://acme.com/fhir/ValueSet/23
```

##### 3.97.4.1.3 Expected Actions

The Terminology Repository shall process the input parameters to
discover the ValueSet that matches the parameters given and return a
response as per Section 3.97.4.2 or an OperationOutcome with an error
message.

#### 3.97.4.2 Expand Value Set Response Message

##### 3.97.4.2.1 Trigger Events

The Terminology Repository found expanded value set matching the input
parameters specified by the Terminology Consumer as a result of a Expand
Value Set Request.

##### 3.97.4.2.2 Message Semantics

See [ITI TF-2: Appendix Z.6](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.6-populating-the-expected-response-format) for more details on response format
handling. See [ITI TF-2: Appendix Z.7](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.7-guidance-on-access-denied-results) for handling guidance for Access
Denied.

The response message is a FHIR ValueSet Resource with the expansion
element populated with the expanded ValueSet concepts.

###### 3.97.4.2.2.1 Example Response Message

An example response message from
<http://hl7.org/fhir/valueset-operation-expand.html> is:

```
HTTP/1.1 200 OK
[other headers]

<ValueSet xmlns="http://hl7.org/fhir">
  <!-- the server SHOULD populate the id with a newly created UUID
    so clients can easily track a particular expansion -->
  <id value="43770626-f685-4ba8-8d66-fb63e674c467"/>
  <!-- no need for meta, though it is allowed for security labels, profiles -->

  <!-- other value set details -->
  <expansion>
    <!-- when expanded -->
    <timestamp value="20141203T08:50:00+11:00"/>
    <contains>
      <!-- expansion contents -->
    </contains>
  </expansion>
</ValueSet>
```

##### 3.97.4.2.3 Expected Actions

The Terminology Consumer has received the response and continues with
its workflow.

### 3.97.5 Security Considerations

See the general Security Consideration in [ITI TF-1: 51.5](volume-1.html#1515-svcm-security-considerations).