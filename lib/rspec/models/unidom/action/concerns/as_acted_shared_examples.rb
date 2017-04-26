shared_examples 'Unidom::Action::Concerns::AsActed' do |model_attributes, actor_party, actor_visitor|

  context do

    acting_1_attributes = {
      actor_visitor_id:   SecureRandom.uuid,
      actor_visitor_type: 'Unidom::Action::ActorVisitor::Mock',
      actor_party_id:     SecureRandom.uuid,
      actor_party_type:   'Unidom::Action::ActorParty::Mock',
      reason_id:          SecureRandom.uuid
    }

    acting_2_attributes = {
      actor_visitor_id:   SecureRandom.uuid,
      actor_visitor_type: 'Unidom::Action::ActorVisitor::Mock',
      actor_party_id:     SecureRandom.uuid,
      actor_party_type:   'Unidom::Action::ActorParty::Mock',
      reason_id:          SecureRandom.uuid
    }

    it_behaves_like 'has_many', model_attributes, :actings, Unidom::Action::Acting, [ acting_1_attributes, acting_2_attributes ]

    model = described_class.create! model_attributes
    it_behaves_like 'assert_present!', model, :is_acted!, [ { from: nil,                  thru: nil,                  due_to: nil, by: actor_party, via: actor_visitor, at: Time.now, action_code: 'C' } ], [ :by, :via, :at, :action_code ]
    it_behaves_like 'assert_present!', model, :is_acted!, [ { from: {},                   thru: {},                   due_to: nil, by: actor_party, via: actor_visitor, at: Time.now, action_code: 'C' } ], [ :by, :via, :at, :action_code ]
    it_behaves_like 'assert_present!', model, :is_acted!, [ { from: { key_1: 'value_1' }, thru: { key_1: 'value_2' }, due_to: nil, by: actor_party, via: actor_visitor, at: Time.now, action_code: 'C' } ], [ :by, :via, :at, :action_code ]

  end

end
