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
acting = Unidom::Action::Acting.create! actor_visitor: user, actor_party: person, reason: reason, acted: person, from_value: {}, thru_value: { name: 'Time' }

# Update the state of the person
person.state = 'R'
person.save!
transition = Unidom::Action::StateTransition.create! transitor_visitor: user, transitor_party: person, reason: reason, subject: person, from_state: 'C', thru_state: 'R'

# Soft destroy the person
person.soft_destroy
obsolescence = Unidom::Action::Obsolescence.create! obsolescer_visitor: user, obsolescer_party: person, reason: reason, obsolesced: person
# The reason could be nil.
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

### As Obsolesced concern

The As Obsolesced concern do the following tasks for the includer automatically:  
1. Define the has_many :obsolescings macro as: ``has_many :obsolescings, class_name: 'Unidom::Action::Obsolescing', as: :obsolesced``  

### As Obsolescer Party concern

The As Obsolescer Party concern do the following tasks for the includer automatically:  
1. Define the has_many :obsolesced_obsolescings macro as: ``has_many :obsolesced_obsolescings, class_name: 'Unidom::Action::Obsolescing', as: :obsolescer_party``  

### As State Subject concern

The As State Subject concern do the following tasks for the includer automatically:  
1. Define the has_many :state_transitions macro as: ``has_many :state_transitions, class_name: 'Unidom::Action::StateTransition', as: :subject``  

### As State Transitor Party concern

The As State Transitor Party concern do the following tasks for the includer automatically:  
1. Define the has_many :transited_state_transitions macro as: ``has_many :transited_state_transitions, class_name: 'Unidom::Action::StateTransition', as: :transitor_party``  
