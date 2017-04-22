shared_examples 'Unidom::Action::Concerns::AsStateTransitorParty' do |model_attributes|

  context do

    state_transition_1_attributes = {
      subject_id:             SecureRandom.uuid,
      subject_type:           'Unidom::Action::Subject::Mock',
      transitor_visitor_id:   SecureRandom.uuid,
      transitor_visitor_type: 'Unidom::Action::TransitorVisitor::Mock',
      reason_id:              SecureRandom.uuid,
      from_state:             'A',
      thru_state:             'B'
    }

    state_transition_2_attributes = {
      subject_id:             SecureRandom.uuid,
      subject_type:           'Unidom::Action::Subject::Mock',
      transitor_visitor_id:   SecureRandom.uuid,
      transitor_visitor_type: 'Unidom::Action::TransitorVisitor::Mock',
      reason_id:              SecureRandom.uuid,
      from_state:             'C',
      thru_state:             'D'
    }

    it_behaves_like 'has_many', model_attributes, :transited_state_transitions, Unidom::Action::StateTransition, [ state_transition_1_attributes, state_transition_2_attributes ]

  end

end
