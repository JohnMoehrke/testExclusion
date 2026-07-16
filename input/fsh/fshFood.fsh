

Instance: ExclusionTHOCodesVS
InstanceOf: ValueSet
Title: "Exclusion THO Codes ValueSet"
Description: "ValueSet for exclusion codes from THO CodeSystem.

This one is expanding from THO, excluding those that are not selectable. So this should NOT have  _ActAccommodationReason. **success**"
Usage: #definition
* experimental = false
* status = #active
* name = "ExclusionTHOCodesVS"
* compose.include.system = "http://terminology.hl7.org/CodeSystem/v3-ActReason"
* compose.exclude.system = "http://terminology.hl7.org/CodeSystem/v3-ActReason"
* compose.exclude.filter.property = http://hl7.org/fhir/concept-properties#notSelectable
* compose.exclude.filter.op = #=
* compose.exclude.filter.value = "true"

CodeSystem: BunchOfPropertiesCS
Title: "CodeSystem properties"
Description: "CodeSystem with a bunch of codeSystem *properties* . These are used in BunchOfCodesCS."
* ^experimental = false
* ^status = #active
* ^caseSensitive = false
* ^content = #complete
* #useful "useful"

Instance: BunchOfCodesCS
InstanceOf: CodeSystem
Title: "codes with custom properties"
Description: "CodeSystem with a bunch of codes with custom properties. The property is a boolean that indicates if the code is useful or not."
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
Title: "excluding non-useful codes from BunchOfCodesCS"
Description: "ValueSet excluding non-useful codes from BunchOfCodesCS.

This valueSet should not have codes that are not useful. Specifically should not have Code2. **success**"
Usage: #definition
* experimental = false
* status = #active
* name = "UsefulBunchOfCodesVS"
* compose.include.system = Canonical(BunchOfCodesCS)
* compose.exclude.system = Canonical(BunchOfCodesCS)
* compose.exclude.filter.property = BunchOfPropertiesCS#useful
* compose.exclude.filter.op = #=
* compose.exclude.filter.value = "false"

Instance: OnlyUsefulBunchOfCodesVS
InstanceOf: ValueSet
Title: "including only useful codes from BunchOfCodesCS"
Description: "ValueSet including useful codes from BunchOfCodesCS. As there is only one code with the property of useful, this ValueSet has only one value. Expansion shows only one code."
Usage: #definition
* experimental = false
* status = #active
* name = "OnlyUsefulBunchOfCodesVS"
* compose.include.system = Canonical(BunchOfCodesCS)
* compose.include.filter.property = BunchOfPropertiesCS#useful
* compose.include.filter.op = #=
* compose.include.filter.value = "true"

Instance: AllOfCodesVS
InstanceOf: ValueSet
Title: "including all codes from BunchOfCodesCS"
Description: "ValueSet including all codes from BunchOfCodesCS."
Usage: #definition
* experimental = false
* status = #active
* name = "AllOfCodesVS"
* compose.include.system = Canonical(BunchOfCodesCS)

Instance: TwoOfCodesVS
InstanceOf: ValueSet
Title: "including two codes from BunchOfCodesCS"
Description: "ValueSet including explicitly two codes from BunchOfCodesCS. Explicit inclusion works as expected."
Usage: #definition
* experimental = false
* status = #active
* name = "TwoOfCodesVS"
* compose.include.system = Canonical(BunchOfCodesCS)
* compose.include.concept[+].code = #code1
* compose.include.concept[+].code = #code3

// Questionnaire that has one item using BunchOfCodesCS
Instance: UsefulBunchOfCodesQuestionnaire
InstanceOf: Questionnaire
Title: "Questionnaire using BunchOfCodesCS"
Description: "Questionnaire using BunchOfCodesCS with UsefulBunchOfCodesVS."
Usage: #definition
* status = #active
* name = "UsefulBunchOfCodesQuestionnaire"
* item[+].linkId = "1"
* item[=].text = "Select a code"
* item[=].type = #choice
* item[=].required = true
* item[=].answerValueSet = Canonical(UsefulBunchOfCodesVS)

// Questionnaire variant that uses only useful codes ValueSet
Instance: OnlyUsefulBunchOfCodesQuestionnaire
InstanceOf: Questionnaire
Title: "Questionnaire using BunchOfCodesCS with OnlyUsefulBunchOfCodesVS"
Description: "Questionnaire using BunchOfCodesCS with OnlyUsefulBunchOfCodesVS."
Usage: #definition
* status = #active
* name = "OnlyUsefulBunchOfCodesQuestionnaire"
* item[+].linkId = "1"
* item[=].text = "Select a code"
* item[=].type = #choice
* item[=].required = true
* item[=].answerValueSet = Canonical(OnlyUsefulBunchOfCodesVS)

// Questionnaire variant that uses all codes ValueSet
Instance: AllOfCodesQuestionnaire
InstanceOf: Questionnaire
Title: "Questionnaire using BunchOfCodesCS with AllOfCodesVS"
Description: "Questionnaire using BunchOfCodesCS with AllOfCodesVS."
Usage: #definition
* status = #active
* name = "AllOfCodesQuestionnaire"
* item[+].linkId = "1"
* item[=].text = "Select a code"
* item[=].type = #choice
* item[=].required = true
* item[=].answerValueSet = Canonical(AllOfCodesVS)

// Questionnaire variant that uses explicit two-code ValueSet
Instance: TwoOfCodesQuestionnaire
InstanceOf: Questionnaire
Title: "Questionnaire using BunchOfCodesCS with TwoOfCodesVS"
Description: "Questionnaire using BunchOfCodesCS with TwoOfCodesVS."
Usage: #definition
* status = #active
* name = "TwoOfCodesQuestionnaire"
* item[+].linkId = "1"
* item[=].text = "Select a code"
* item[=].type = #choice
* item[=].required = true
* item[=].answerValueSet = Canonical(TwoOfCodesVS)

// QuestionnaireResponse that has one answer using UsefulBunchOfCodesVS
Instance: GoodUsefulBunchOfCodesQuestionnaireResponse
InstanceOf: QuestionnaireResponse
Title: "QuestionnaireResponse using UsefulBunchOfCodesVS"
Description: "QuestionnaireResponse using a good code from UsefulBunchOfCodesVS."
Usage: #example
* status = #completed
* questionnaire = Canonical(UsefulBunchOfCodesQuestionnaire)
* item[+].linkId = "1"
* item[=].answer[+].valueCoding = BunchOfCodesCS#code1

// QuestionnaireResponse that has one answer in the codeSystem but is not allowed in the ValueSet
Instance: BadUsefulBunchOfCodesQuestionnaireResponse
InstanceOf: QuestionnaireResponse
Title: "QuestionnaireResponse using UsefulBunchOfCodesVS with a code that is not
allowed in the ValueSet"
Description: "QuestionnaireResponse using code3 from BunchOfCodesCS against UsefulBunchOfCodesQuestionnaire. This should throw a validation error when code3 is not in UsefulBunchOfCodesVS. It does throw a validation error.**success**"
Usage: #example
* status = #completed
* questionnaire = Canonical(UsefulBunchOfCodesQuestionnaire)
* item[+].linkId = "1"
* item[=].answer[+].valueCoding = BunchOfCodesCS#code3

// QuestionnaireResponse that has one valid answer for only-useful questionnaire
Instance: GoodOnlyUsefulBunchOfCodesQuestionnaireResponse
InstanceOf: QuestionnaireResponse
Title: "QuestionnaireResponse using good code for OnlyUsefulBunchOfCodesVS questionnaire"
Description: "QuestionnaireResponse using code2 from BunchOfCodesCS against OnlyUsefulBunchOfCodesQuestionnaire."
Usage: #example
* status = #completed
* questionnaire = Canonical(OnlyUsefulBunchOfCodesQuestionnaire)
* item[+].linkId = "1"
* item[=].answer[+].valueCoding = BunchOfCodesCS#code2

// QuestionnaireResponse variant using code3 against only-useful questionnaire
Instance: BadOnlyUsefulBunchOfCodesQuestionnaireResponse
InstanceOf: QuestionnaireResponse
Title: "QuestionnaireResponse using code3 against OnlyUsefulBunchOfCodesVS questionnaire"
Description: "QuestionnaireResponse using code3 from BunchOfCodesCS against OnlyUsefulBunchOfCodesQuestionnaire.

code3 is not in OnlyUsefulBunchOfCodesVS, so this should throw a validation error. This does throw an error. **success**"
Usage: #example
* status = #completed
* questionnaire = Canonical(OnlyUsefulBunchOfCodesQuestionnaire)
* item[+].linkId = "1"
* item[=].answer[+].valueCoding = BunchOfCodesCS#code3

// QuestionnaireResponse that has one valid answer for all-codes questionnaire
Instance: Good1AllOfCodesQuestionnaireResponse
InstanceOf: QuestionnaireResponse
Title: "QuestionnaireResponse using good code for AllOfCodesVS questionnaire"
Description: "QuestionnaireResponse using code1 from BunchOfCodesCS against AllOfCodesQuestionnaire."
Usage: #example
* status = #completed
* questionnaire = Canonical(AllOfCodesQuestionnaire)
* item[+].linkId = "1"
* item[=].answer[+].valueCoding = BunchOfCodesCS#code1

// QuestionnaireResponse variant using code2 against all-codes questionnaire
Instance: Good2AllOfCodesQuestionnaireResponse
InstanceOf: QuestionnaireResponse
Title: "QuestionnaireResponse using code2 against AllOfCodesVS questionnaire"
Description: "QuestionnaireResponse using code2 from BunchOfCodesCS against AllOfCodesQuestionnaire. This should pass validation because AllOfCodesVS includes all codes."
Usage: #example
* status = #completed
* questionnaire = Canonical(AllOfCodesQuestionnaire)
* item[+].linkId = "1"
* item[=].answer[+].valueCoding = BunchOfCodesCS#code2

// QuestionnaireResponse that has one valid answer for two-of-codes questionnaire
Instance: GoodTwoOfCodesQuestionnaireResponse
InstanceOf: QuestionnaireResponse
Title: "QuestionnaireResponse using good code for TwoOfCodesVS questionnaire"
Description: "QuestionnaireResponse using code1 from BunchOfCodesCS against TwoOfCodesQuestionnaire."
Usage: #example
* status = #completed
* questionnaire = Canonical(TwoOfCodesQuestionnaire)
* item[+].linkId = "1"
* item[=].answer[+].valueCoding = BunchOfCodesCS#code1

// QuestionnaireResponse variant using code2 against two-code questionnaire
Instance: BadTwoOfCodesQuestionnaireResponse
InstanceOf: QuestionnaireResponse
Title: "QuestionnaireResponse using code2 against TwoOfCodesVS questionnaire"
Description: "QuestionnaireResponse using code2 from BunchOfCodesCS against TwoOfCodesQuestionnaire. This does throw a validation error because TwoOfCodesVS includes only code1 and code3."
Usage: #example
* status = #completed
* questionnaire = Canonical(TwoOfCodesQuestionnaire)
* item[+].linkId = "1"
* item[=].answer[+].valueCoding = BunchOfCodesCS#code2



// CodeSystem with three codes, the second code is marked as retired.
Instance: SomeRetiredCodeCS
InstanceOf: CodeSystem
Title: "CodeSystem with a retired code"
Description: "CodeSystem with some good and a retired code"
Usage: #definition
* experimental = false
* status = #active
* caseSensitive = false
* content = #complete
* name = "SomeRetiredCodeCS"
* property[+].code = #status
* property[=].uri = "http://hl7.org/fhir/concept-properties#status"
* property[=].type = #code
* concept[+].code = #code1
* concept[=].display = "Code 1"
* concept[=].definition = "Definition for code 1"
* concept[=].property[+].code = #status
* concept[=].property[=].valueCode = #active
* concept[+].code = #code2
* concept[=].display = "Code 2"
* concept[=].definition = "Definition for code 2"
* concept[=].property[+].code = #status
* concept[=].property[=].valueCode = #retired
* concept[+].code = #code3
* concept[=].display = "Code 3"
* concept[=].definition = "Definition for code 3"
* concept[=].property[+].code = #status
* concept[=].property[=].valueCode = #active

// ValueSet that includes all codes from SomeRetiredCodeCS
Instance: AllCodeVS
InstanceOf: ValueSet
Title: "including all codes from SomeRetiredCodeCS"
Description: "ValueSet including all codes from SomeRetiredCodeCS. This seems to act in the validator properly, and the expansion will show all codes, including the retired code with indication of retired."
Usage: #definition
* experimental = false
* status = #active
* name = "AllCodeVS"
* compose.include.system = Canonical(SomeRetiredCodeCS)

// ValueSet that includes only the non-retired codes from SomeRetiredCodeCS
Instance: OnlyActiveCodeVS
InstanceOf: ValueSet
Title: "including only the active codes from SomeRetiredCodeCS"
Description: "ValueSet including only the active codes from SomeRetiredCodeCS (using include filtering). 
This will act in the validator properly, and the expansion will show only the active codes."
Usage: #definition
* experimental = false
* status = #active
* name = "OnlyActiveCodeVS"
* compose.include.system = Canonical(SomeRetiredCodeCS)
* compose.include.filter.property = http://hl7.org/fhir/concept-properties#status
* compose.include.filter.op = #=
* compose.include.filter.value = #active

Instance: ExcludeRetiredCodeVS
InstanceOf: ValueSet
Title: "excluding retired codes from SomeRetiredCodeCS"
Description: "ValueSet excluding retired codes from SomeRetiredCodeCS.
This will act in the validator properly, but the expansion will show the retired codes. **success**"
Usage: #definition
* experimental = false
* status = #active
* name = "ExcludeRetiredCodeVS"
* compose.include.system = Canonical(SomeRetiredCodeCS)
* compose.exclude.system = Canonical(SomeRetiredCodeCS)
* compose.exclude.filter.property = http://hl7.org/fhir/concept-properties#status
* compose.exclude.filter.op = #=
* compose.exclude.filter.value = #retired

// Questionnaire variant that uses ExcludeRetiredCodeVS
Instance: ExcludeRetiredCodeQuestionnaire
InstanceOf: Questionnaire
Title: "Questionnaire using SomeRetiredCodeCS with ExcludeRetiredCodeVS"
Description: "Questionnaire using SomeRetiredCodeCS with ExcludeRetiredCodeVS. Retired codes should be disallowed."
Usage: #definition  
* status = #active
* name = "ExcludeRetiredCodeQuestionnaire"
* item[+].linkId = "1"
* item[=].text = "Select a code"
* item[=].type = #choice
* item[=].required = true
* item[=].answerValueSet = Canonical(ExcludeRetiredCodeVS)

// Questionnaire variant that uses all codes ValueSet
Instance: AllCodeQuestionnaire
InstanceOf: Questionnaire
Title: "Questionnaire using SomeRetiredCodeCS with AllCodeVS"
Description: "Questionnaire using SomeRetiredCodeCS with AllCodeVS. Retired codes are allowed."
Usage: #definition
* status = #active
* name = "AllCodeQuestionnaire"
* item[+].linkId = "1"
* item[=].text = "Select a code"
* item[=].type = #choice
* item[=].required = true
* item[=].answerValueSet = Canonical(AllCodeVS)

// Questionnaire variant that uses only active codes ValueSet
Instance: OnlyActiveCodeQuestionnaire
InstanceOf: Questionnaire
Title: "Questionnaire using SomeRetiredCodeCS with OnlyActiveCodeVS"
Description: "Questionnaire using SomeRetiredCodeCS with OnlyActiveCodeVS. Retired codes should be disallowed."
Usage: #definition
* status = #active
* name = "OnlyActiveCodeQuestionnaire"
* item[+].linkId = "1"
* item[=].text = "Select a code"
* item[=].type = #choice
* item[=].required = true
* item[=].answerValueSet = Canonical(OnlyActiveCodeVS)

// QuestionnaireResponse that has one answer using SomeRetiredCodeCS
Instance: GoodExcludeRetiredCodeQuestionnaireResponse
InstanceOf: QuestionnaireResponse
Title: "QuestionnaireResponse using good code for ExcludeRetiredCodeVS questionnaire"
Description: "QuestionnaireResponse using an active code from SomeRetiredCodeCS against ExcludeRetiredCodeQuestionnaire."
Usage: #example
* status = #completed
* questionnaire = Canonical(ExcludeRetiredCodeQuestionnaire)
* item[+].linkId = "1"
* item[=].answer[+].valueCoding = SomeRetiredCodeCS#code1

// QuestionnaireResponse that has one answer in the codeSystem but is not allowed in the ValueSet
Instance: BadExcludeRetiredCodeQuestionnaireResponse
InstanceOf: QuestionnaireResponse
Title: "QuestionnaireResponse using a retired code against ExcludeRetiredCodeVS questionnaire"
Description: "QuestionnaireResponse using a retired code from SomeRetiredCodeCS against ExcludeRetiredCodeQuestionnaire.
This throw a validation error. **success**"
Usage: #example
* status = #completed
* questionnaire = Canonical(ExcludeRetiredCodeQuestionnaire)
* item[+].linkId = "1"
* item[=].answer[+].valueCoding = SomeRetiredCodeCS#code2

// QuestionnaireResponse that has one valid answer for all-codes questionnaire
Instance: GoodAllCodeQuestionnaireResponse
InstanceOf: QuestionnaireResponse
Title: "QuestionnaireResponse using good code for AllCodeVS questionnaire"
Description: "QuestionnaireResponse using an active code from SomeRetiredCodeCS against AllCodeQuestionnaire."
Usage: #example
* status = #completed
* questionnaire = Canonical(AllCodeQuestionnaire)
* item[+].linkId = "1"
* item[=].answer[+].valueCoding = SomeRetiredCodeCS#code1

// QuestionnaireResponse that has one retired answer against the all-codes questionnaire
Instance: BadAllCodeQuestionnaireResponse
InstanceOf: QuestionnaireResponse
Title: "QuestionnaireResponse using a retired code against AllCodeVS questionnaire"
Description: "QuestionnaireResponse using a retired code from SomeRetiredCodeCS against AllCodeQuestionnaire.
This throws a validation warning because the code is inactive/retired.  **success**"
Usage: #example
* status = #completed
* questionnaire = Canonical(AllCodeQuestionnaire)
* item[+].linkId = "1"
* item[=].answer[+].valueCoding = SomeRetiredCodeCS#code2

// QuestionnaireResponse that has one valid answer for only-active questionnaire
Instance: GoodOnlyActiveCodeQuestionnaireResponse
InstanceOf: QuestionnaireResponse
Title: "QuestionnaireResponse using good code for OnlyActiveCodeVS questionnaire"
Description: "QuestionnaireResponse using an active code from SomeRetiredCodeCS against OnlyActiveCodeQuestionnaire."
Usage: #example
* status = #completed
* questionnaire = Canonical(OnlyActiveCodeQuestionnaire)
* item[+].linkId = "1"
* item[=].answer[+].valueCoding = SomeRetiredCodeCS#code1

// QuestionnaireResponse that has one retired answer against the active-only questionnaire
Instance: BadOnlyActiveCodeQuestionnaireResponse
InstanceOf: QuestionnaireResponse
Title: "QuestionnaireResponse using a retired code against OnlyActiveCodeVS questionnaire"
Description: "QuestionnaireResponse using a retired code from SomeRetiredCodeCS against OnlyActiveCodeQuestionnaire.
This does throw a validation error."
Usage: #example
* status = #completed
* questionnaire = Canonical(OnlyActiveCodeQuestionnaire)
* item[+].linkId = "1"
* item[=].answer[+].valueCoding = SomeRetiredCodeCS#code2

