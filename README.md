# Unidom Action 审计领域模型引擎

[![License](https://img.shields.io/badge/license-MIT-green.svg)](http://opensource.org/licenses/MIT)
[![Gem Version](https://badge.fury.io/rb/unidom-action.svg)](https://badge.fury.io/rb/unidom-action)
[![Dependency Status](https://gemnasium.com/badges/github.com/topbitdu/unidom-action.svg)](https://gemnasium.com/github.com/topbitdu/unidom-action)

Unidom (UNIfied Domain Object Model) is a series of domain model engines. The Action domain model engine includes the Reason, State Transition, Obsolescene, and the Acting models.
Unidom (统一领域对象模型)是一系列的领域模型引擎。审计领域模型引擎包括原因、状态迁移、废弃和行为日志的模型。



## Recent Update

Check out the [Road Map](ROADMAP.md) to find out what's the next.
Check out the [Change Log](CHANGELOG.md) to find out what's new.



## Usage in Gemfile

```ruby
gem 'unidom-action'
```



## Run the Database Migration

```shell
rake db:migrate
```
The migration versions start with 200005.



## Call the Model

```ruby
reason = Unidom::Action::Reason.create! activity_code: 'SRRR', name: 'broken', description: 'The box was broken.'
# SRRR = Shipment Receipt Rejection Reason

user   = Unidom::Visitor::User.create!

# Create/Update/Delete the person
person = Unidom::Party::Person.create! name: 'Tim'
acting = Unidom::Action::Acting.create! actor_visitor: user, actor_party: person, reason: reason, acted: person, from_value: {}, thru_value: { name: 'Tim' }
# or the following source code do the exact same thing
acting = Unidom::Action::Acting.act! person, from: {}, thru: { name: 'Tim' }, due_to: reason, by: person, via: user, at: Time.now, action_code: 'C'

actings = Unidom::Action::Acting.acted_via(user).acted_by(person).acted_is(person).caused_by(reason)

# Update the state of the person
person.state = 'R'
person.save!
# Create a state transition to record the above change
transition = Unidom::Action::StateTransition.create! transitor_visitor: user, transitor_party: person, reason: reason, subject: person, from_state: 'C', thru_state: 'R'
# The following source code also create a state transition to record the above change
transition = Unidom::Action::StateTransition.transit! transitor_visitor: user, transitor_party: person, reason: reason, subject: person, from_state: 'C', thru_state: 'R', opened_at: Time.now
# The reason could be nil.
transitions = Unidom::Action::StateTransition.transited_via(user).transited_by(person).subject_is(subject).caused_by(reason).from_transited_to('C').thru_transited_to('R')

# Soft destroy the person
person.soft_destroy
# Create an obsolescing to record the above change
obsolescing = Unidom::Action::Obsolescing.create! obsolescer_visitor: user, obsolescer_party: person, reason: reason, obsolesced: person, obsolescence_code: 'OBSL'
# The following source code also create an obsolescing to record the above change
obsolescing = Unidom::Action::Obsolescing.obsolesce! obsolesced: person, obsolescer_visitor: user, obsolescer_party: person, reason: reason, obsolescence_code: 'OBSL', opened_at: Time.now
# The reason could be nil.
obsolescings = Unidom::Action::Obsolescing.obsolesced_via(user).obsolesced_by(person).obsolesced_is(person).caused_by(reason).obsolescence_coded_as('OBSL')
```



## Include the Concern

```ruby
include Unidom::Action::Concerns::AsActed
include Unidom::Action::Concerns::AsObsolesced
include Unidom::Action::Concerns::AsObsolescerParty
include Unidom::Action::Concerns::AsStateSubject
include Unidom::Action::Concerns::AsStateTransitorParty
```

### As Acted concern

The As Acted concern do the following tasks for the includer automatically:  
1. Define the has_many :actings macro as: ``has_many :actings, class_name: 'Unidom::Action::Acting', as: :acted``  
2. Define the #is_acted! method as: ``is_acted!(from: nil, thru: nil, due_to: nil, by: nil, via: nil, at: Time.now, action_code: 'C')``  
3. Define the #is_acted? method as: ``is_acted?(due_to: nil, by: nil, via: nil, at: Time.now, action_code: 'C')``

### As Actor Party concern

The As Actor Party concern do the following tasks for the includer automatically:  
1. Define the has_many :acted_actings macro as: ``has_many :acted_actings, class_name: 'Unidom::Action::Acting', as: :actor_party``  
2. Define the #act! method as: ``act!(on: nil, from: nil, thru: nil, due_to: nil, via: nil, at: Time.now, action_code: 'C')``  

### As Obsolesced concern

The As Obsolesced concern do the following tasks for the includer automatically:  
1. Define the has_many :obsolescings macro as: ``has_many :obsolescings, class_name: 'Unidom::Action::Obsolescing', as: :obsolesced``  
2. Define the #is_obsolesced! method as: ``is_obsolesced!(obsolescence_code: 'OBSL', due_to: nil, via: nil, by: nil, at: Time.now)``  
3. Define the #is_obsolesced? method as: ``is_obsolesced?(obsolescence_code: 'OBSL', due_to: nil, via: nil, by: nil, at: Time.now)``

### As Obsolescer Party concern

The As Obsolescer Party concern do the following tasks for the includer automatically:  
1. Define the has_many :obsolesced_obsolescings macro as: ``has_many :obsolesced_obsolescings, class_name: 'Unidom::Action::Obsolescing', as: :obsolescer_party``  
2. Define the #obsolesce! method as: ``obsolesce!(it, obsolescence_code: 'OBSL', due_to: nil, via: nil, at: Time.now)``  
3. Define the #obsolesce? method as: ``obsolesce?(it, obsolescence_code: 'OBSL', due_to: nil, via: nil, at: Time.now)``

### As State Subject concern

The As State Subject concern do the following tasks for the includer automatically:  
1. Define the has_many :state_transitions macro as: ``has_many :state_transitions, class_name: 'Unidom::Action::StateTransition', as: :subject``  
2. Define the #is_transited! method as: ``is_transited!(from: nil, thru: nil, due_to: nil, via: nil, by: nil, at: Time.now)``  
3. Define the #is_transited? method as: ``is_transited?(from: nil, thru: nil, due_to: nil, via: nil, by: nil, at: Time.now)``

### As State Transitor Party concern

The As State Transitor Party concern do the following tasks for the includer automatically:  
1. Define the has_many :transited_state_transitions macro as: ``has_many :transited_state_transitions, class_name: 'Unidom::Action::StateTransition', as: :transitor_party``  
2. Define the #transit! method as: ``transit!(it, from: nil, thru: nil, due_to: nil, via: nil, at: Time.now)``  
3. Define the #transit? method as: ``transit?(it, from: nil, thru: nil, due_to: nil, via: nil, at: Time.now)``
