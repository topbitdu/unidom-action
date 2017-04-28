# Unidom Action 审计领域模型引擎

[![Documentation](http://img.shields.io/badge/docs-rdoc.info-blue.svg)](http://www.rubydoc.info/gems/unidom-action/frames)
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

# Search the people
found_count = Unidom::Party::Person.where(name: 'Tim').count
shown_count = ... # the item count on the current page, it's calculated per found_count, page, & per_page
total_pages = ... # the total page count calculated per found_count, & per_page

@people = Unidom::Party::Person.where(name: 'Tim').paginate page: params[:page], per_page: params[:per_page]||Rails.configuration.pagination[:administration_v2_people][:per_page]

searching = Unidom::Action::Searching.search! 'people',
  on:              'administration',
  version:         '2',
  per:             { name: 'Tim' },
  by:              current_person,
  via:             current_user,
  displaying:      10,
  of_total:        63,
  on_current_page: params[:page],
  of_total_page:   7,
  per_page:        params[:per_page]||Rails.configuration.pagination[:administration_v2_people][:per_page]

```



## Include the Concern

```ruby
include Unidom::Action::Concerns::AsActed
include Unidom::Action::Concerns::AsActorParty
include Unidom::Action::Concerns::AsObsolesced
include Unidom::Action::Concerns::AsObsolescerParty
include Unidom::Action::Concerns::AsSearcherParty
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

3. Define the #act? method as: ``act?(on: nil, due_to: nil, via: nil, at: Time.now, action_code: 'C')``

### As Caused concern

The As Caused concern do the following tasks for the includer automatically:

1. Define the belongs_to :reason macro as: ``belongs_to :reason, class_name: 'Unidom::Action::Reason'``

2. Define the caused_by scope as: ``scope :caused_by, ->(reason) { where reason_id: to_id(reason) }``

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

### As Searcher Party concern

The As Searcher Party concern do the following tasks for the includer automatically:

1. Define the has_many :searched_searchings macro as: ``has_many :searched_searchings, class_name: 'Unidom::Action::Searching', as: :searcher_party``

2. Define the #search! method as: ``search!(it, on: '', version: '1', per: {}, due_to: nil, via: nil, at: Time.now, displaying: 0, of_total: 0, on_current_page: 0, of_total_page: 0, per_page: 0)``

3. Define the #search? method as: ``search?(it, on: '', version: '1', due_to: nil, at: Time.now)``

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



## Enum codes

### Obsolescence enum code

```ruby
Unidom::Action::Obsolescence::OBSOLESCE
Unidom::Action::Obsolescence::RECOVER
```

### Action enum code

```ruby
Unidom::Action::Action::CREATE
Unidom::Action::Action::DESTROY
Unidom::Action::Action::INDEX
Unidom::Action::Action::SHOW
Unidom::Action::Action::UPDATE
```



## Disable the Model & Migration

If you only need the app components other than models, the migrations should be neglected, and the models should not be loaded.
```ruby
# config/initializers/unidom.rb
Unidom::Common.configure do |options|

  options[:neglected_namespaces] = %w{
    Unidom::Action
  }

end
```



## RSpec examples

### RSpec example manifest (run automatically)

```ruby
# spec/models/unidom_spec.rb
require 'unidom/action/models_rspec'

# spec/types/unidom_spec.rb
require 'unidom/action/types_rspec'

# spec/validators/unidom_spec.rb
require 'unidom/action/validators_rspec'
```

### RSpec shared examples (to be integrated)

```ruby
# app/models/your_acted.rb
class YourActed < ApplicationRecord

  include Unidom::Common::Concerns::ModelExtension
  include Unidom::Action::Concerns::AsActed

end

# app/models/your_actor_party.rb
class YourActorParty < ApplicationRecord

  include Unidom::Common::Concerns::ModelExtension
  include Unidom::Action::Concerns::AsActorParty

end

# The Unidom::Action::Acting model, the Unidom::Action::Obsolescing model, the Unidom::Action::Searching model, & the Unidom::Action::StateTransition model already include the Unidom::Action::Concerns::AsCaused concern
# app/models/your_caused.rb
class YourCaused < ApplicationRecord

  include Unidom::Common::Concerns::ModelExtension
  include Unidom::Action::Concerns::AsCaused

end

# app/models/your_obsolesced.rb
class YourObsolesced < ApplicationRecord

  include Unidom::Common::Concerns::ModelExtension
  include Unidom::Action::Concerns::AsObsolesced

end

# app/models/your_obsolescer_party.rb
class YourObsolescerParty < ApplicationRecord

  include Unidom::Common::Concerns::ModelExtension
  include Unidom::Action::Concerns::AsObsolescerParty

end

# app/models/your_searcher_party.rb
class YourSearcherParty < ApplicationRecord

  include Unidom::Common::Concerns::ModelExtension
  include Unidom::Action::Concerns::AsSearcherParty

end

# app/models/your_state_subject.rb
class YourStateSubject < ApplicationRecord

  include Unidom::Common::Concerns::ModelExtension
  include Unidom::Action::Concerns::AsStateSubject

end

# app/models/your_state_transitor_party.rb
class YourStateTransitorParty < ApplicationRecord

  include Unidom::Common::Concerns::ModelExtension
  include Unidom::Action::Concerns::AsStateTransitorParty

end

# spec/support/unidom_rspec_shared_examples.rb
require 'unidom/action/rspec_shared_examples'

# spec/models/your_acted_spec.rb
describe YourActed, type: :model do

  context do

    model_attribtues = {
      your_attribute: 'your value'
    }

    actor_party   = Unidom::Party::Person.create! name: 'Tim'
    actor_visitor = Unidom::Visitor::User.create!

    it_behaves_like 'Unidom::Action::Concerns::AsActed', model_attributes, actor_party, actor_visitor

  end

end

# spec/models/your_actor_party_spec.rb
describe YourActorParty, type: :model do

  context do

    model_attribtues = {
      your_attribute: 'your value'
    }

    it_behaves_like 'Unidom::Action::Concerns::AsActorParty', model_attribtues

  end

end

# spec/models/your_caused_spec.rb
describe YourCaused, type: :model do

  context do

    model_attribtues = {
      your_attribute: 'your value'
    }

    it_behaves_like 'Unidom::Action::Concerns::AsCaused', model_attribtues

  end

end

# spec/models/your_obsolesced_spec.rb
describe YourObsolesced, type: :model do

  context do

    model_attribtues = {
      your_attribute: 'your value'
    }

    it_behaves_like 'Unidom::Action::Concerns::AsObsolesced', model_attribtues

  end

end

# spec/models/your_obsolescer_party_spec.rb
describe YourObsolescerParty, type: :model do

  model_attribtues = {
    your_attribute: 'your value'
  }

  it_behaves_like 'Unidom::Action::Concerns::AsObsolescerParty', model_attribtues

end

# spec/models/your_searcher_party_spec.rb
describe YourSearcherParty, type: :model do

  model_attribtues = {
    your_attribute: 'your value'
  }

  it_behaves_like 'Unidom::Action::Concerns::AsSearcherParty', model_attribtues

end

# spec/models/your_state_subject_spec.rb
describe YourStateSubject, type: :model do

  model_attribtues = {
    your_attribute: 'your value'
  }

  it_behaves_like 'Unidom::Action::Concerns::AsStateSubject', model_attribtues

end

# spec/models/your_state_transitor_party_spec.rb
describe YourAsStateTransitorParty, type: :model do

  model_attribtues = {
    your_attribute: 'your value'
  }

  it_behaves_like 'Unidom::Action::Concerns::YourAsStateTransitorParty', model_attribtues

end
```
