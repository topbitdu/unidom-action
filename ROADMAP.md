# Unidom Action Roadmap 审计领域模型引擎路线图

## v0.1
1. Reason model & migration (20000501000000)
2. State Transition model & migration (20000511000000)

## v0.2
1. Obsolescence model & migration
2. Improve the State Transition model & migration to add the #transitor_visitor & the #transitor_party fields

## v0.3
1. Acting model & migration

## v0.4
1. As State Subject concern
2. Rename the Obsolescence model to the Obsolescing model
3. Improve the Obsolescing model to add the #obsolescence_code

## v0.5
1. As Obsolesced concern
2. As Acted concern

## v0.6
1. As State Transitor Party concern
2. As Obsolescer Party concern

## v0.7
1. As Actor Party concern

## v1.0
1. Improve the State Transition model to add the .transit! method
2. Improve the Obsolescing model to add the .obsolesce! method

## v1.1
1. Improve the State Transition model to add the .transited_via scope, the .transited_by scope, the .subject_is scope, & the .caused_by scope
2. Improve the Obsolescing model to add the .obsolesced_via scope, the .obsolesced_by scope, the .obsolesced_is scope, & the .caused_by scope
3. Improve the Acting model to add the .acted_via scope, the .acted_by scope, the .acted_is scope, & the .caused_by scope

## v1.2
1. Improve the As State Subject concern to add the #is_transited! method
2. Improve the As Obsolesced concern to add the #is_obsolesced! method

## v1.3
1. Improve the As State Subject concern to add the #is_transited? method
2. Improve the As Obsolesced concern to add the #is_obsolesced? method

## v1.4
1. Improve the Acting model to add the .act! method
2. Improve the As Acted concern to add the #is_acted! method

## v1.5
1. Improve the As Acted concern to add the #is_acted? method

## v1.6
1. Improve the As State Transitor Party concern to add the #transit! method
2. Improve the As Obsolescer Party concern to add the #obsolesce! method

## v1.7
1. Improve the As State Transitor Party concern to add the #transit? method
2. Improve the As Obsolescer Party concern to add the #obsolesce? method

## v1.8
1. Improve the As Actor Party concern to add the #act! method

## v1.9
1. Improve the As Actor Party concern to add the #act? method

## v1.9.1
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.6

## v1.9.2
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.7

## v1.10
1. Obsolescence enum code
2. Improve the Obsolescing model to configure the Obsolescence enum code

## v1.11
1. Action enum code
2. Improve the Acting model to configure the Action enum code

## v1.11.1
1. Improve the Ruby Gem Specification to depend on [progne_tapera](https://github.com/topbitdu/progne_tapera) v0.3

## v1.12
1. Searching model & migration

## v1.13
1. Improve the Searching model to add the .search! method
