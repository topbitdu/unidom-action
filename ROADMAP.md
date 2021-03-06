# Unidom Action Roadmap 审计领域模型引擎路线图

## v0.1
1. Reason model & migration (20000501000000)
2. State Transition model & migration (20000511000000)

## v0.2
1. Obsolescence model & migration (20000512000000)
2. Improve the State Transition model & migration to add the #``transitor_visitor`` & the #``transitor_party`` fields

## v0.3
1. Acting model & migration

## v0.4
1. As State Subject concern
2. Rename the Obsolescence model to the Obsolescing model
3. Improve the Obsolescing model to add the #``obsolescence_code``

## v0.5
1. As Obsolesced concern
2. As Acted concern

## v0.6
1. As State Transitor Party concern
2. As Obsolescer Party concern

## v0.7
1. As Actor Party concern

## v1.0
1. Improve the State Transition model to add the .``transit!`` method
2. Improve the Obsolescing model to add the .``obsolesce!`` method

## v1.1
1. Improve the State Transition model to add the ``transited_via`` scope, the ``transited_by`` scope, the ``subject_is`` scope, & the ``caused_by`` scope
2. Improve the Obsolescing model to add the ``obsolesced_via`` scope, the ``obsolesced_by`` scope, the ``obsolesced_is`` scope, & the ``caused_by`` scope
3. Improve the Acting model to add the ``acted_via`` scope, the ``acted_by`` scope, the ``acted_is`` scope, & the ``caused_by`` scope

## v1.2
1. Improve the As State Subject concern to add the #``is_transited!`` method
2. Improve the As Obsolesced concern to add the #``is_obsolesced!`` method

## v1.3
1. Improve the As State Subject concern to add the #``is_transited?`` method
2. Improve the As Obsolesced concern to add the #``is_obsolesced?`` method

## v1.4
1. Improve the Acting model to add the .``act!`` method
2. Improve the As Acted concern to add the #``is_acted!`` method

## v1.5
1. Improve the As Acted concern to add the #``is_acted?`` method

## v1.6
1. Improve the As State Transitor Party concern to add the #``transit!`` method
2. Improve the As Obsolescer Party concern to add the #``obsolesce!`` method

## v1.7
1. Improve the As State Transitor Party concern to add the #``transit?`` method
2. Improve the As Obsolescer Party concern to add the #``obsolesce?`` method

## v1.8
1. Improve the As Actor Party concern to add the #``act!`` method

## v1.9
1. Improve the As Actor Party concern to add the #``act?`` method

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
1. Improve the Searching model to add the .``search!`` method

## v1.14
1. As Searcher Party concern

## v1.15
1. Improve the As Searcher Party concern to add the #``search!`` method

## v1.16
1. Improve the As Searcher Party concern to add the #``search?`` method

## v1.16.1
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.8
2. Improve the Ruby Gem Specification to never depend on [progne_tapera](https://github.com/topbitdu/progne_tapera)
3. Improve the Engine class to include the Engine Extension concern

## v1.16.2
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.9
2. Improve the models to support the namespace neglecting

## v1.17
1. Models RSpec examples manifest
2. Types RSpec examples manifest
3. Validators RSpec examples manifest

## v1.17.1
1. Improve the Reason spec for the validations on the #``name`` attribute
2. Improve the Acting spec for the #``action_code`` attribute
3. Improve the Obsolescing spec for the #``obsolescence_code`` attribute

## v1.17.2
1. Improve the Acting spec for the ``belongs_to :reason, class_name: 'Unidom::Action::Reason'`` macro
2. Improve the Obsolescing spec for the ``belongs_to :reason, class_name: 'Unidom::Action::Reason'`` macro
3. Improve the Searching spec for the ``belongs_to :reason, class_name: 'Unidom::Action::Reason'`` macro
4. Improve the State Transition spec for the ``belongs_to :reason, class_name: 'Unidom::Action::Reason'`` macro

## v1.17.3
1. Improve the Acting spec for the ``caused_by`` scope
2. Improve the Obsolescing spec for the ``caused_by`` scope
3. Improve the Searching spec for the ``caused_by`` scope
4. Improve the State Transition spec for the ``caused_by`` scope

## v1.17.4
1. Improve the Searching model for the validations on the #``resource_name`` attribute, the #``platform_name`` attribute, & the #``platform_version`` attribute
2. Improve the Searching spec for the validations on the #``resource_name`` attribute, the #``platform_name`` attribute, & the #``platform_version`` attribute

## v1.17.5
1. Improve the Searching model for the validations on the #``found_count`` attribute, the #``shown_count`` attribute, the #``per_page`` attribute, the #``total_pages`` attribute, & the #``current_page`` attribute
2. Improve the Searching spec for the validations on the #``found_count`` attribute, the #``shown_count`` attribute, the #``per_page`` attribute, the #``total_pages`` attribute, & the #``current_page`` attribute

## v1.17.6
1. Improve the Searching spec for the validations on the #``found_count`` attribute, the #``shown_count`` attribute, the #``per_page`` attribute, the #``total_pages`` attribute, & the #``current_page`` attribute
2. Improve the Reason spec for the validations on the #``name`` attribute

## v1.17.7
1. Improve the Searching model for the validations on the #``resource_name`` attribute, & the #``platform_name`` attribute
2. Improve the Searching spec for the validations on the #``resource_name`` attribute, & the #``platform_name`` attribute

## v1.17.8
1. As Caused concern
2. Improve the Acting model, the Obsolescing model, the Searching model, & the State Transition model to include the As Caused concern
3. As Caused shared examples
4. RSpec shared examples manifest
5. Improve the Acting spec, the Obsolescing spec, the Searching spec, & the State Transition spec for the As Caused concern

## v1.17.9
1. As Acted shared examples
2. As Actor Party shared examples

## v1.17.10
1. Improve the As Obsolesced concern for the argument validations of the #``is_obsolesced!`` method
2. As Obsolesced shared examples
3. Improve the RSpec shared examples manifest to require the As Obsolesced shared examples

## v1.17.11
1. As Obsolescer Party shared examples
2. Improve the RSpec shared examples manifest to require the As Obsolescer Party shared examples

## v1.17.12
1. As Searcher Party shared examples
2. Improve the RSpec shared examples manifest to require the As Searcher Party shared examples

## v1.17.13
1. As State Subject shared examples
2. Improve the RSpec shared examples manifest to require the As State Subject shared examples

## v1.17.14
1. As State Transitor Party shared examples
2. Improve the RSpec shared examples manifest to require the As State Transitor Party shared examples

## v1.17.15
1. Improve the As Acted concern for the argument validations of the #``is_acted!`` method
2. Improve the As Acted shared examples for the argument validations of the #is_acted! method

## v1.17.16
1. Improve the As Actor Party concern for the argument validations of the #act! method
2. Improve the As Actor Party shared examples for the argument validations of the #act! method

## v1.17.17
1. Improve the As Obsolesced concern for the argument validations of the #is_acted! method
2. Improve the As Obsolesced shared examples for the argument validations of the #is_acted! method

## v1.17.18
1. Improve the Ruby Gem Specification to depend on unidom-common v1.10
2. Improve the Reason migration, the Acting migration, the State Transition migration, the Obsolescing migration, & the Searching migration for the #opened_at column, & the #closed_at column
