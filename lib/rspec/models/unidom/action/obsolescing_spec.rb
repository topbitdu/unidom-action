describe Unidom::Action::Obsolescing, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      obsolescer_visitor_id:   SecureRandom.uuid,
      obsolescer_visitor_type: 'Unidom::Action::ObsolescerVisitor::Mock',
      obsolescer_party_id:     SecureRandom.uuid,
      obsolescer_party_type:   'Unidom::Action::ObsolescerParty::Mock',
      obsolesced_id:           SecureRandom.uuid,
      obsolesced_type:         'Unidom::Action::Obsolesced::Mock',
      reason_id:               SecureRandom.uuid,
      obsolescence_code:       'OBSL'
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

  end

end