shared_examples 'Unidom::Action::Concerns::AsActorParty' do |model_attributes, acted, actor_visitor|

  context do

    acting_1_attributes = {
      acted_id:           SecureRandom.uuid,
      acted_type:         'Unidom::Action::Acted::Mock',
      actor_visitor_id:   SecureRandom.uuid,
      actor_visitor_type: 'Unidom::Action::ActorVisitor::Mock',
      reason_id:          SecureRandom.uuid
    }

    acting_2_attributes = {
      acted_id:           SecureRandom.uuid,
      acted_type:         'Unidom::Action::Acted::Mock',
      actor_visitor_id:   SecureRandom.uuid,
      actor_visitor_type: 'Unidom::Action::ActorVisitor::Mock',
      reason_id:          SecureRandom.uuid
    }

    it_behaves_like 'has_many', model_attributes, :acted_actings, Unidom::Action::Acting, [ acting_1_attributes, acting_2_attributes ]

    model = described_class.create! model_attributes
    it_behaves_like 'assert_present!', model, :act!, [ { on: acted, from: nil,                  thru: nil,                  due_to: nil, via: actor_visitor, at: Time.now, action_code: 'C' } ], [ :on, :via, :at, :action_code ]
    it_behaves_like 'assert_present!', model, :act!, [ { on: acted, from: {},                   thru: {},                   due_to: nil, via: actor_visitor, at: Time.now, action_code: 'C' } ], [ :on, :via, :at, :action_code ]
    it_behaves_like 'assert_present!', model, :act!, [ { on: acted, from: { key_1: 'value_1' }, thru: { key_1: 'value_2' }, due_to: nil, via: actor_visitor, at: Time.now, action_code: 'C' } ], [ :on, :via, :at, :action_code ]

  end

end
