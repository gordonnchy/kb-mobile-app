import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/input_field_option.dart';

class NoneAgywEnrollmentFormSection {
  static List<String> getMandatoryField() {
    return [
      'sJ35hsF6Lf9',
      'z9hUdWsyBXB',
      'sJ35hsF6Lf9',
      'location',
      'WTZ7GLTrE8Q',
      'rSP9c21JsfC',
      'qZP982qpSPS'
    ];
  }

  static List<FormSection> getFormSections() {
    return [
      FormSection(
        name: 'HTS Client Intake Record',
        color: Color(0xFF258DCC),
        inputFields: [
          InputField(
              id: 'location',
              name: 'Location',
              valueType: 'ORGANISATION_UNIT',
              allowedSelectedLevels: [3],
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'atNbeYwzMq6',
              name: 'Site Name',
              valueType: 'TEXT',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'CgvXK6ZmFb6',
              name: 'Counselor Name',
              valueType: 'TEXT',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'WTZ7GLTrE8Q',
              name: 'First Name',
              valueType: 'TEXT',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 's1HaiT6OllL',
              name: 'Middle Name',
              valueType: 'TEXT',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'rSP9c21JsfC',
              name: 'Surname',
              valueType: 'TEXT',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'sJ35hsF6Lf9',
            name: 'Client Type',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'F', name: 'F'),
              InputFieldOption(code: 'M', name: 'M'),
              InputFieldOption(code: 'CF', name: 'CF'),
              InputFieldOption(code: 'CM', name: 'CM')
            ],
          ),
          InputField(
              id: 'NDigy1JKTNV',
              name: 'Is it a couple?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'wRU2FLKUXer',
              name: 'Partner\'s name',
              valueType: 'TEXT',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'z9hUdWsyBXB',
            name: 'Service Type',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(
                  code: 'CounselingTesting', name: 'Counseling Testing'),
              InputFieldOption(
                  code: 'Counseling only', name: 'Counseling only'),
              InputFieldOption(code: 'Testing only', name: 'Testing only')
            ],
          ),
          InputField(
            id: 'vIX4GTSCX4P',
            name: 'Sex',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Male', name: 'Male'),
              InputFieldOption(code: 'Female', name: 'Female')
            ],
          ),
          InputField(
              id: 'qZP982qpSPS',
              name: 'Date of Birth',
              valueType: 'DATE',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'ls9hlz2tyol',
              name: 'Age',
              isReadObly: true,
              valueType: 'NUMBER',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'PN92g65TkVI',
            name: 'Program Status',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Not enrolled', name: 'Not enrolled'),
              InputFieldOption(code: 'Active', name: 'Active'),
              InputFieldOption(code: 'Exit', name: 'Exit'),
              InputFieldOption(code: 'Transferred', name: 'Transferred'),
              InputFieldOption(code: 'Graduated', name: 'Graduated')
            ],
          ),
          InputField(
            id: 's1eRvsL2Ly4',
            name: 'Marital Status',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Never married', name: 'Never married'),
              InputFieldOption(
                  code: 'Currently married to one person',
                  name: 'Currently married to one person'),
              InputFieldOption(
                  code: 'Polygamous Marriage', name: 'Polygamous Marriage'),
              InputFieldOption(code: 'Divorced', name: 'Divorced'),
              InputFieldOption(code: 'Separated', name: 'Separated'),
              InputFieldOption(code: 'Widowed', name: 'Widowed'),
              InputFieldOption(
                  code: 'Living with unmarried partner',
                  name: 'Living with unmarried partner'),
              InputFieldOption(code: 'Other', name: 'Other')
            ],
          ),
          InputField(
              id: 'DuWh8Gqwmjf',
              name: 'Specify marital status',
              valueType: 'TEXT',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'VCHs81FiJy0',
              name: 'Number of children under 16 years',
              valueType: 'NUMBER',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'rdTi0PhbJ2f',
              name: 'Are you or your partner currently pregnant?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'lIKV6FwuEAu',
              name: 'Are you or your partner currently breastfeeding?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'IzpeMJCYdY3',
              name:
                  'Are you or your partner planning to have a child within next 2 years?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: '',
            name: 'Occupation',
            valueType: 'CHECK_BOX',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'TGyGM2W86lI', name: 'Unemployed'),
              InputFieldOption(code: 'P30CAgvi9aJ', name: 'Student'),
              InputFieldOption(code: 'mhCDr6kR2Kd', name: 'Farmer/Farm worker'),
              InputFieldOption(
                  code: 'g91sLXH63DS', name: 'Domestic worker/gardener'),
              InputFieldOption(code: 'g2kn25zA6F2', name: 'Guard'),
              InputFieldOption(code: 'gPZlKPp32pl', name: 'Professional'),
              InputFieldOption(code: 'IE87JCiIBa7', name: 'Informal Trader'),
              InputFieldOption(code: 'jrv5kdmkcuk', name: 'Military/Uniformed'),
              InputFieldOption(
                  code: 'a6zQBSLXblz', name: 'Trucker/Truck driver'),
              InputFieldOption(
                  code: 'mkxVfNhSflG', name: 'Commercial Sex Worker'),
              InputFieldOption(code: 'fAFhtu0hgtC', name: 'Mine worker'),
              InputFieldOption(code: 'Y4dPrHZt7zu', name: 'Other(sp)')
            ],
          ),
          InputField(
              id: 'yHAjVqDrXuk',
              name: 'Specify other occupation',
              valueType: 'TEXT',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'CHGgb5j2Q9C',
            name: 'Highest Level of Education Attained:',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'None', name: 'None'),
              InputFieldOption(
                  code: 'Less than Standard 7', name: 'Less than Standard 7'),
              InputFieldOption(
                  code: 'Secondary School', name: 'Secondary School'),
              InputFieldOption(code: 'High School', name: 'High School'),
              InputFieldOption(
                  code: 'College CertificateDiploma',
                  name: 'College CertificateDiploma'),
              InputFieldOption(
                  code: 'University Degree', name: 'University Degree'),
              InputFieldOption(
                  code: 'Graduate DegreeMastersPhD',
                  name: 'Graduate DegreeMastersPhD')
            ],
          ),
          InputField(
            id: '',
            name: 'Reasons for visiting site',
            valueType: 'CHECK_BOX',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(
                  code: 'UHVI3qHmuE8', name: 'I Have multiple partners'),
              InputFieldOption(
                  code: 'Vb6PnBKyTMo',
                  name: 'I Have a child who is sick or died'),
              InputFieldOption(code: 'EVWGGunQ349', name: 'My Partner died'),
              InputFieldOption(
                  code: 'ity7CyZHyqE',
                  name: 'I Worried about my past behaviour/curious'),
              InputFieldOption(
                  code: 'aayhISGUuut',
                  name: 'I Worried abut my partner’s behaviour/status'),
              InputFieldOption(code: 'Wfnk8y9jxPA', name: 'My Partner is sick'),
              InputFieldOption(
                  code: 'jq8Lwo7mmKB',
                  name: 'My Partner has tested positive for HIV'),
              InputFieldOption(
                  code: 'aidssV5DBCX', name: 'I am feeling unwell'),
              InputFieldOption(
                  code: 'IVNtCt94hcn',
                  name: 'I was Advised by my family/friends'),
              InputFieldOption(
                  code: 'GSCvB7kMXsj',
                  name: 'I was Advised by health care worker'),
              InputFieldOption(
                  code: 'kSHcQ7GMTyz', name: 'I am Planning to get married'),
              InputFieldOption(
                  code: 'e1vmWq3vRLw',
                  name: 'I am Getting serious/stopping condoms'),
              InputFieldOption(
                  code: 'RszIBO0MV2L', name: 'I am Planning to have a baby'),
              InputFieldOption(code: 'yDH9g8RgVF1', name: 'I am pregnant'),
              InputFieldOption(
                  code: 'YdmwV9DYKBw', name: 'My Partner requested'),
              InputFieldOption(code: 'bG00RdeHbzZ', name: 'For life insurance'),
              InputFieldOption(
                  code: 'IvfnumFvkm5', name: 'For scholarship/studies'),
              InputFieldOption(code: 'ciN6EvS4g1e', name: 'For travel/visa'),
              InputFieldOption(
                  code: 'hwDtsqQZniS',
                  name: 'I am Retesting (Closing the window)'),
              InputFieldOption(
                  code: 'hfRfomMbY6s',
                  name: 'I am Retesting (Confirmation of HIV positive)'),
              InputFieldOption(code: 'vUobJnyivtf', name: 'Other(sp)')
            ],
          ),
          InputField(
              id: 'Lj7CDNvvtw5',
              name: 'Other reason for visiting the site',
              valueType: 'TEXT',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: '',
            name: 'How did you learn of this center?',
            valueType: 'CHECK_BOX',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'aKIQBIQhUIm', name: 'Friend'),
              InputFieldOption(code: 'owE8P4FKggZ', name: 'Partner/Spouse'),
              InputFieldOption(
                  code: 'gj949am6Rbq', name: 'Other Family Member'),
              InputFieldOption(code: 'AdmjXPgHtjt', name: 'Other HTC client'),
              InputFieldOption(code: 'JS200phQBDy', name: 'Health worker'),
              InputFieldOption(code: 'kzlm8qKF1mP', name: 'Poster'),
              InputFieldOption(code: 'bSMyoKdy49g', name: 'Community'),
              InputFieldOption(code: 'FAhg9Ddzinm', name: 'TV advert'),
              InputFieldOption(code: 'wvMxfs2njzw', name: 'Radio advert'),
              InputFieldOption(
                  code: 'ZfmlC3z2UFu', name: 'Newspaper advert or article'),
              InputFieldOption(code: 'ulJwlQIOLQA', name: 'Other(sp)')
            ],
          ),
          InputField(
              id: 'CcMOQFuS5Uy',
              name: 'Specify other ways you learnt of this center',
              valueType: 'TEXT',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'WAlaenCYazT',
              name: 'Ever been tested for HIV?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'ZUhWRJSajUE',
              name: 'How many times?',
              valueType: 'NUMBER',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'K9y9eMHeSfa',
            name: 'What were the most recent results?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Positive', name: 'Positive'),
              InputFieldOption(code: 'Negative', name: 'Negative'),
              InputFieldOption(code: 'Indeterminate', name: 'Indeterminate'),
              InputFieldOption(code: 'Didn\'t collect', name: 'Didn\'t collect')
            ],
          ),
          InputField(
              id: 'T4jtufXMh73',
              name: 'How long ago was your most recent test?',
              valueType: 'TEXT',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'MabTaKRVTk6',
            name:
                'Has your most recent sex partiner been tested in the last 3 months?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(
                  code: 'Yes,result was negative 4',
                  name: 'Yes,result was negative 4'),
              InputFieldOption(
                  code: 'Yes,result was positive 5',
                  name: 'Yes,result was positive 5'),
              InputFieldOption(
                  code: 'Yes,but I don’t know the result 6',
                  name: 'Yes,but I don’t know the result 6')
            ],
          ),
          InputField(
            id: 'U90wPGZgftv',
            name: 'Ever received a blood transfusion?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: '1', name: 'Yes'),
              InputFieldOption(code: '0', name: 'No'),
              InputFieldOption(code: '0.000001', name: 'NA')
            ],
          ),
          InputField(
            id: 'uBaYzuSsNts',
            name: 'History of sexual abuse?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: '1', name: 'Yes'),
              InputFieldOption(code: '0', name: 'No'),
              InputFieldOption(code: '0.000001', name: 'NA')
            ],
          ),
          InputField(
            id: 'F3g7aYQNOwW',
            name: 'Ever had vaginal sexual intercourse?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: '1', name: 'Yes'),
              InputFieldOption(code: '0', name: 'No'),
              InputFieldOption(code: '0.000001', name: 'NA')
            ],
          ),
          InputField(
            id: 'a4cZRyZbgaP',
            name: 'Ever had anal intercourse?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: '1', name: 'Yes'),
              InputFieldOption(code: '0', name: 'No'),
              InputFieldOption(code: '0.000001', name: 'NA')
            ],
          ),
          InputField(
              id: 'zvGJ4XV5vaK',
              name: 'At what age did you have sex?',
              valueType: 'NUMBER',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'vltqaOOIChC',
              name: 'In last 12 months have you had sex while intoxicated?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'ABXLlTiHysm',
              name:
                  'In last 12 months have you exchanged money/material for sex?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'zkbozPIE3Zh',
              name:
                  'In last 12 month have you had unprotected sexual intercourse?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'hWBVFd8DTRj',
              name: 'In last 12 months have you had a blood transfusion?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'oDnqGLMuwgo',
              name:
                  'In last 12 months have you had shared needles for injections?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'wI9gNztaVzD',
            name:
                'Have you had genital sores or unusual leakage within the past 12 months?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: '1', name: 'Yes'),
              InputFieldOption(code: '0', name: 'No'),
              InputFieldOption(code: '0.000001', name: 'NA')
            ],
          ),
          InputField(
            id: 'BL8liR3gxy6',
            name: 'Currently have genital sores or unusual leakage?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: '1', name: 'Yes'),
              InputFieldOption(code: '0', name: 'No'),
              InputFieldOption(code: '0.000001', name: 'NA')
            ],
          ),
          InputField(
              id: 'h5llEgMRPEy',
              name:
                  'How many sexual partners(including your spouse)have you had sex with in the last 12 months?',
              valueType: 'NUMBER',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'N505gDx35lK',
            name:
                'Do you currently have more than one sexual partner(including your spouse)?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: '1', name: 'Yes'),
              InputFieldOption(code: '0', name: 'No'),
              InputFieldOption(code: '0.000001', name: 'NA')
            ],
          ),
          InputField(
            id: 'irTgmXk3Lo8',
            name:
                'The last time you had sex with a non-regular partner,did you use a condom?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: '1', name: 'Yes'),
              InputFieldOption(code: '0', name: 'No'),
              InputFieldOption(code: '0.000001', name: 'NA')
            ],
          ),
          InputField(
            id: 'bgigq6VXGlz',
            name:
                'The last time you had sex with a regular partner, did you use a condom?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: '1', name: 'Yes'),
              InputFieldOption(code: '0', name: 'No'),
              InputFieldOption(code: '0.000001', name: 'NA')
            ],
          ),
          InputField(
            id: 'llhNCWTFjAL',
            name: 'Have you ever talked to anyone about HTS?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: '1', name: 'Yes'),
              InputFieldOption(code: '0', name: 'No'),
              InputFieldOption(code: '0.000001', name: 'NA')
            ],
          ),
          InputField(
            id: 'GnuckKsbxtk',
            name: 'Have you ever talked to your spouse about HTS?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: '1', name: 'Yes'),
              InputFieldOption(code: '0', name: 'No'),
              InputFieldOption(code: '0.000001', name: 'NA')
            ],
          ),
          InputField(
            id: 'pjdU6Cgwy5j',
            name: 'Have you ever talked to your regular partner about HTS?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: '1', name: 'Yes'),
              InputFieldOption(code: '0', name: 'No'),
              InputFieldOption(code: '0.000001', name: 'NA')
            ],
          ),
          InputField(
            id: 'aQv0U93Wg1R',
            name: 'Rapid test Result #1',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Positive', name: 'Positive'),
              InputFieldOption(code: 'Negative', name: 'Negative'),
              InputFieldOption(code: 'Indeterminate', name: 'Indeterminate')
            ],
          ),
          InputField(
              id: 'Wrp7gvBvzUB',
              name: 'Date bled #1',
              valueType: 'DATE',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'QSknntVjZYx',
            name: 'Rapid test Result #2',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Positive', name: 'Positive'),
              InputFieldOption(code: 'Negative', name: 'Negative'),
              InputFieldOption(code: 'Indeterminate', name: 'Indeterminate')
            ],
          ),
          InputField(
              id: 'NTgKh8ETh01',
              name: 'Date bled #2',
              valueType: 'DATE',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'PnFpOz95RuW',
            name: 'Rapid test Result #3',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Positive', name: 'Positive'),
              InputFieldOption(code: 'Negative', name: 'Negative'),
              InputFieldOption(code: 'Indeterminate', name: 'Indeterminate')
            ],
          ),
          InputField(
              id: 'OY4b1YNhvJC',
              name: 'Date bled #3',
              valueType: 'DATE',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'w4DBU1hJtxd',
              name: 'Confirmatory test necessary?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'IYD4dA4EBnX',
            name: 'Confirmatory test Result #3',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'Positive', name: 'Positive'),
              InputFieldOption(code: 'Negative', name: 'Negative'),
              InputFieldOption(code: 'Indeterminate', name: 'Indeterminate')
            ],
          ),
          InputField(
              id: 'gDVLu47xsH8',
              name: 'Client refused to receive test results?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'cE1sgG2arw4',
              name: 'Client informed of Test results',
              valueType: 'DATE',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: 'fs00ZqYiq6h',
            name: 'Period between testing and Informed results?',
            valueType: 'TEXT',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(code: 'minutes', name: 'Minutes'),
              InputFieldOption(code: 'hours', name: 'Hours'),
              InputFieldOption(code: 'days', name: 'Days'),
              InputFieldOption(code: 'weeks', name: 'Weeks'),
              InputFieldOption(code: 'months', name: 'Months')
            ],
          ),
          InputField(
              id: 'W8mAvBSM3Pg',
              name: 'Client received Post Test Counselling?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'tB5Htsd5jlr',
              name: 'Disclosure of Status Planned?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'zXlncmz51aw',
              name: 'Disclosure of Status to whom?',
              valueType: 'TEXT',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'MlgzbQNpeqj',
              name: 'Risk Reduction Plan Made?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
            id: '',
            name: 'Plan',
            valueType: 'CHECK_BOX',
            inputColor: Color(0xFF258DCC),
            labelColor: Color(0xFF737373),
            options: [
              InputFieldOption(
                  code: 'tTmeXXmDO4S',
                  name: 'Reduce risk through use of condom'),
              InputFieldOption(
                  code: 'povx6WxobsZ', name: 'Reduce risk through monogamy'),
              InputFieldOption(
                  code: 'Mu9huWfFi6X', name: 'Rreduce risk through abstinence'),
              InputFieldOption(
                  code: 't3jLGKYPh8P',
                  name: 'Reduce risk through Treatment of of STIs'),
              InputFieldOption(
                  code: 'IZgsyl3yhGB',
                  name: 'Reduce risk through Decreased # of partners')
            ],
          ),
          InputField(
              id: 'IJUy3A0IVpr',
              name: 'Referral made?',
              valueType: 'BOOLEAN',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373)),
          InputField(
              id: 'Hr43Ub9GNyP',
              name: 'Referral made to',
              valueType: 'TEXT',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373),
              options: [
                InputFieldOption(code: 'TB screening', name: 'TB screening'),
                InputFieldOption(code: 'STI services', name: 'STI services'),
                InputFieldOption(code: 'HBC', name: 'HBC'),
                InputFieldOption(
                    code: 'Family Planning', name: 'Family Planning'),
                InputFieldOption(code: 'PMTCT', name: 'PMTCT'),
                InputFieldOption(code: 'Nutritional', name: 'Nutritional'),
                InputFieldOption(code: 'Medical', name: 'Medical'),
                InputFieldOption(code: 'Financial', name: 'Financial'),
                InputFieldOption(code: 'Legal', name: 'Legal'),
                InputFieldOption(
                    code: 'PsychoSocial SupportSupport Group',
                    name: 'PsychoSocial SupportSupport Group'),
                InputFieldOption(
                    code: 'Nutritional DrugAlcohol Abuse',
                    name: 'Nutritional DrugAlcohol Abuse')
              ])
        ],
      ),
      FormSection(
          name: 'For HIV negative clients',
          color: Color(0xFF258DCC),
          inputFields: [
            InputField(
                id: 'cruxHKlynFI',
                name: 'Client\'s weight(KG)',
                valueType: 'NUMBER',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'rSv8udBKoCv',
                name: 'Sexual partner with HIV is not ART',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'ZYhkYueaOxC',
                name:
                    'Sexual partner who has been on ART for less than 6 months',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'uvkZ4vHUzxv',
                name:
                    'Sexual partner who has been on ART for more than 6 months but is not virally suppressed',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'Se87hpRzGGB',
                name:
                    'Vaginal or anal sexual intercourse without condoms with more than one partner',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'NftUCxEqj1W',
                name: 'A sexual partner with one or more HIV risk factors',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'q3JCqCyX4aI',
                name:
                    'A history of a sexually transmitted infection(STI)by lab testing or self-report or syndromic STI treatment',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
            InputField(
                id: 'rBktFvgfp52',
                name:
                    'Client has requested PrEP and has received information on PrEP including which people would benefit from PrEP and client still feels they would benefit from PrEP',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373)),
          ])
    ];
  }
}