

Instance: ExclusionCodesVS
InstanceOf: ValueSet
Title: "Example Exclusion Codes ValueSet"
Description: "Example ValueSet for exclusion codes for completeness sake. No actual use of this ValueSet other than an example.

This one is expanding from THO, excluding those that are not selectable. So this should NOT have  _ActAccommodationReason."
Usage: #definition
* experimental = false
* status = #active
* name = "ExclusionCodesVS"
* compose.include.system = "http://terminology.hl7.org/CodeSystem/v3-ActReason"
* compose.exclude.system = "http://terminology.hl7.org/CodeSystem/v3-ActReason"
* compose.exclude.filter.property = http://hl7.org/fhir/concept-properties#notSelectable
* compose.exclude.filter.op = #=
* compose.exclude.filter.value = "true"

CodeSystem: BunchOfPropertiesCS
Title: "Example CodeSystem with a bunch of properties"
Description: "Example CodeSystem with a bunch of properties for completeness sake. No actual use of this CodeSystem other than an example"
* ^experimental = false
* ^status = #active
* ^caseSensitive = false
* ^content = #complete
* #useful "useful"

Instance: BunchOfCodesCS
InstanceOf: CodeSystem
Title: "Example CodeSystem with a bunch of codes"
Description: "Example CodeSystem with a bunch of codes for completeness sake. No actual use of this CodeSystem other than an example"
Usage: #definition
* experimental = false  
* status = #active
* caseSensitive = false
* content = #complete
* name = "BunchOfCodesCS"
* property[+].code = #useful
* property[=].uri = "http://johnmoehrke.github.io/testexclusion/CodeSystem/BunchOfPropertiesCS#useful"
* property[=].type = #boolean
* concept[+].code = #code1
* concept[=].display = "Code 1"
* concept[=].definition = "Definition for code 1"
* concept[+].code = #code2
* concept[=].display = "Code 2"
* concept[=].definition = "Definition for code 2"
* concept[=].property[+].code = BunchOfPropertiesCS#useful
* concept[=].property[=].valueBoolean = true
* concept[+].code = #code3
* concept[=].display = "Code 3"
* concept[=].definition = "Definition for code 3"
* concept[=].property[+].code = BunchOfPropertiesCS#useful
* concept[=].property[=].valueBoolean = false

Instance: UsefulBunchOfCodesVS
InstanceOf: ValueSet
Title: "Example ValueSet including useful codes from BunchOfCodesCS"
Description: "Example ValueSet including useful codes from BunchOfCodesCS for completeness sake. No actual use of this ValueSet other than an example.

This valueSet should not have codes that are not useful. Specifically should not have Code2."
Usage: #definition
* experimental = false
* status = #active
* name = "UsefulBunchOfCodesVS"
* compose.include.system = Canonical(BunchOfCodesCS)
* compose.exclude.system = Canonical(BunchOfCodesCS)
* compose.exclude.filter.property = BunchOfPropertiesCS#useful
* compose.exclude.filter.op = #=
* compose.exclude.filter.value = "false"

Instance: AllOfCodesVS
InstanceOf: ValueSet
Title: "Example ValueSet including all codes from BunchOfCodesCS"
Description: "Example ValueSet including all codes from BunchOfCodesCS for completeness sake.
No actual use of this ValueSet other than an example."
Usage: #definition
* experimental = false
* status = #active
* name = "AllOfCodesVS"
* compose.include.system = Canonical(BunchOfCodesCS)

// Questionnaire that has one item using UsefulBunchOfCodesVS
Instance: UsefulBunchOfCodesQuestionnaire
InstanceOf: Questionnaire
Title: "Example Questionnaire using UsefulBunchOfCodesVS"
Description: "Example Questionnaire using UsefulBunchOfCodesVS for completeness sake. No actual use of this Questionnaire other than an example."
Usage: #definition
* status = #active
* name = "UsefulBunchOfCodesQuestionnaire"
* item[+].linkId = "1"
* item[=].text = "Select a code"
* item[=].type = #choice
* item[=].required = true
* item[=].answerValueSet = Canonical(UsefulBunchOfCodesVS)

// QuestionnaireResponse that has one answer using UsefulBunchOfCodesVS
Instance: UsefulBunchOfCodesQuestionnaireResponse
InstanceOf: QuestionnaireResponse
Title: "Example QuestionnaireResponse using UsefulBunchOfCodesVS"
Description: "Example QuestionnaireResponse using UsefulBunchOfCodesVS for completeness sake. No actual use of this QuestionnaireResponse other than an example."
Usage: #example
* status = #completed
* questionnaire = Canonical(UsefulBunchOfCodesQuestionnaire)
* item[+].linkId = "1"
* item[=].answer[+].valueCoding = BunchOfCodesCS#code1

// QuestionnaireResponse that has one answer in the codeSystem but is not allowed in the ValueSet
Instance: NotUsefulBunchOfCodesQuestionnaireResponse
InstanceOf: QuestionnaireResponse
Title: "Example QuestionnaireResponse using UsefulBunchOfCodesVS with a code that is not
allowed in the ValueSet"
Description: "Example QuestionnaireResponse using UsefulBunchOfCodesVS for completeness sake. No actual use of this QuestionnaireResponse other than an example."
Usage: #example
* status = #completed
* questionnaire = Canonical(UsefulBunchOfCodesQuestionnaire)
* item[+].linkId = "1"
* item[=].answer[+].valueCoding = BunchOfCodesCS#code2

