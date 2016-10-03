# Unidom Action Roadmap 审计领域模型引擎路线图

## v0.1
1. Reason model & migration
2. State Transition model & migration

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
1. As State Transitor Visitor concern
2. As Obsolescer Visitor concern

## v0.8
1. As Actor Party concern
2. As Actor Visitor concern

## v1.0
1. Improve the State Transition model to add the .transit! method
2. Improve the Obsolescing model to add the .obsolesce! method

## v1.1
1. Improve the State Subject concern to add the #is_transited! method
2. Improve the Obsolesced concern to add the #is_obsolesced! method

## v1.2
1. Improve the State Subject concern to add the #is_transited? method
2. Improve the Obsolesced concern to add the #is_obsolesced? method

## v1.3
1. Improve the Acting model to ad the .act! method
2. Improve the As Acted concern to add the #is_acted! method

## v1.4
1. Improve the As Acted concern to add the #is_acted? method

## v1.5
1. Improve the As State Transitor Party concern to add the #transit! method
2. Improve the As Obsolescer Party concern to add the obsolesce! method

## v1.6
1. Improve the As State Transitor Party concern to add the #transit? method
2. Improve the As Obsolescer Party concern to add the obsolesce? method
