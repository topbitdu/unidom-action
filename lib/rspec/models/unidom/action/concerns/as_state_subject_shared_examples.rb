shared_examples 'Unidom::Action::Concerns::AsStateSubject' do |model_attributes|

  context do

    state_transition_1_attributes = {
      transitor_party_id:     SecureRandom.uuid,
      transitor_party_type:   'Unidom::Action::Subject::Mock',
      transitor_visitor_id:   SecureRandom.uuid,
      transitor_visitor_type: 'Unidom::Action::SearcherVisitor::Mock',
      reason_id:              SecureRandom.uuid,
      from_state:             'C',
      thru_state:             'A'
    }

    state_transition_2_attributes = {
      transitor_party_id:     SecureRandom.uuid,
      transitor_party_type:   'Unidom::Action::Subject::Mock',
      transitor_visitor_id:   SecureRandom.uuid,
      transitor_visitor_type: 'Unidom::Action::SearcherVisitor::Mock',
      reason_id:              SecureRandom.uuid,
      from_state:             'K',
      thru_state:             'E'
    }

    it_behaves_like 'has_many', model_attributes, :state_transitions, Unidom::Action::StateTransition, [ state_transition_1_attributes, state_transition_2_attributes ]

  end

end
