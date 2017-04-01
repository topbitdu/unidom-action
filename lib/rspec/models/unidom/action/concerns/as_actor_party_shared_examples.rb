shared_examples 'Unidom::Action::Concerns::AsActorParty' do |model_attributes|

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

end
