shared_examples 'Unidom::Action::Concerns::AsObsolesced' do |model_attributes|

  context do

    obsolescing_1_attributes = {
      obsolescer_visitor_id:   SecureRandom.uuid,
      obsolescer_visitor_type: 'Unidom::Action::ObsolescerVisitor::Mock',
      obsolescer_party_id:     SecureRandom.uuid,
      obsolescer_party_type:   'Unidom::Action::ObsolescerParty::Mock',
      obsolesced_id:           SecureRandom.uuid,
      obsolesced_type:         'Unidom::Action::Obsolesced::Mock',
      reason_id:               SecureRandom.uuid
    }

    obsolescing_2_attributes = {
      obsolescer_visitor_id:   SecureRandom.uuid,
      obsolescer_visitor_type: 'Unidom::Action::ObsolescerVisitor::Mock',
      obsolescer_party_id:     SecureRandom.uuid,
      obsolescer_party_type:   'Unidom::Action::ObsolescerParty::Mock',
      obsolesced_id:           SecureRandom.uuid,
      obsolesced_type:         'Unidom::Action::Obsolesced::Mock',
      reason_id:               SecureRandom.uuid
    }

    it_behaves_like 'has_many', model_attributes, :obsolescings, Unidom::Action::Obsolescing, [ obsolescing_1_attributes, obsolescing_2_attributes ]

  end

end
