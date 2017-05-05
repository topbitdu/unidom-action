shared_examples 'Unidom::Action::Concerns::AsObsolesced' do |model_attributes, obsolescer_party, obsolescer_visitor|

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

    model = described_class.create! model_attributes
    it_behaves_like 'assert_present!', model, :is_obsolesced!, [ { obsolescence_code: 'OBSL', due_to: nil, by: obsolescer_party, via: obsolescer_visitor, at: Time.now } ], [ :by, :via, :at, :obsolescence_code ]

  end

end
