shared_examples 'Unidom::Action::Concerns::AsObsolescerParty' do |model_attributes|

  context do

    obsolescing_1_attributes = {
      obsolesced_id:           SecureRandom.uuid,
      obsolesced_type:         'Unidom::Action::Obsolesced::Mock',
      obsolescer_visitor_id:   SecureRandom.uuid,
      obsolescer_visitor_type: 'Unidom::Action::ObsolescerVisitor::Mock',
      reason_id:               SecureRandom.uuid,
      obsolescence_code:       'OBSL'
    }

    obsolescing_2_attributes = {
      obsolesced_id:           SecureRandom.uuid,
      obsolesced_type:         'Unidom::Action::Obsolesced::Mock',
      obsolescer_visitor_id:   SecureRandom.uuid,
      obsolescer_visitor_type: 'Unidom::Action::ObsolescerVisitor::Mock',
      reason_id:               SecureRandom.uuid,
      obsolescence_code:       'RCVR'
    }

    it_behaves_like 'has_many', model_attributes, :obsolesced_obsolescings, Unidom::Action::Obsolescing, [ obsolescing_1_attributes, obsolescing_2_attributes ]

  end

end
