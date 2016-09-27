# Unidom Action 审计领域模型引擎

[![License](https://img.shields.io/badge/license-MIT-green.svg)](http://opensource.org/licenses/MIT)
[![Gem Version](https://badge.fury.io/rb/unidom-action.svg)](https://badge.fury.io/rb/unidom-action)

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

person = Unidom::Party::Person.create! name: 'Tim'

transition = Unidom::Action::StateTransition.create! reason: reason, subject: person, from_state: 'C', thru_state: 'R'
```
