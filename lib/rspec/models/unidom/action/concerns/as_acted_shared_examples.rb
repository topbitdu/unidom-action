shared_examples 'Unidom::Action::Concerns::AsActed' do |model_attributes|

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

  end

end
