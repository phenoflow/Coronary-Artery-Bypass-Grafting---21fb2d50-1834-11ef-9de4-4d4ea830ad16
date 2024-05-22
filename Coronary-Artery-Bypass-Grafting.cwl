cwlVersion: v1.0
steps:
  read-potential-cases-disc:
    run: read-potential-cases-disc.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
      potentialCases:
        id: potentialCases
        source: potentialCases
  other-coronary-artery-bypass-grafting---primary:
    run: other-coronary-artery-bypass-grafting---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-disc/output
  coronary-artery-bypass-grafting-allograft---primary:
    run: coronary-artery-bypass-grafting-allograft---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: other-coronary-artery-bypass-grafting---primary/output
  coronary-artery-bypass-grafting-specified---primary:
    run: coronary-artery-bypass-grafting-specified---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: coronary-artery-bypass-grafting-allograft---primary/output
  coronary-artery-bypass-grafting-connection---primary:
    run: coronary-artery-bypass-grafting-connection---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: coronary-artery-bypass-grafting-specified---primary/output
  single-coronary-artery-bypass-grafting---primary:
    run: single-coronary-artery-bypass-grafting---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: coronary-artery-bypass-grafting-connection---primary/output
  coronary-artery-bypass-grafting-autograft---primary:
    run: coronary-artery-bypass-grafting-autograft---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: single-coronary-artery-bypass-grafting---primary/output
  coronary-artery-bypass-grafting-operation---primary:
    run: coronary-artery-bypass-grafting-operation---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: coronary-artery-bypass-grafting-autograft---primary/output
  prosthetic-coronary-artery-bypass-grafting---primary:
    run: prosthetic-coronary-artery-bypass-grafting---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: coronary-artery-bypass-grafting-operation---primary/output
  coronary-artery-bypass-grafting---primary:
    run: coronary-artery-bypass-grafting---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: prosthetic-coronary-artery-bypass-grafting---primary/output
  coronary-artery-bypass-grafting-revision---primary:
    run: coronary-artery-bypass-grafting-revision---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: coronary-artery-bypass-grafting---primary/output
  coronary-artery-bypass-grafting-anastomosis---primary:
    run: coronary-artery-bypass-grafting-anastomosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: coronary-artery-bypass-grafting-revision---primary/output
  coronary-artery-bypass-grafting-mammary---primary:
    run: coronary-artery-bypass-grafting-mammary---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: coronary-artery-bypass-grafting-anastomosis---primary/output
  coronary-artery-bypass-grafting-three---primary:
    run: coronary-artery-bypass-grafting-three---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: coronary-artery-bypass-grafting-mammary---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: coronary-artery-bypass-grafting-three---primary/output
class: Workflow
inputs:
  potentialCases:
    id: potentialCases
    doc: Input of potential cases for processing
    type: File
  inputModule1:
    id: inputModule1
    doc: Python implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
