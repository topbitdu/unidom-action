describe Unidom::Action::StateTransition, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      transitor_visitor_id:   SecureRandom.uuid,
      transitor_visitor_type: 'Unidom::Action::TransitorVisitor::Mock',
      transitor_party_id:     SecureRandom.uuid,
      transitor_party_type:   'Unidom::Action::TransitorParty::Mock',
      subject_id:             SecureRandom.uuid,
      subject_type:           'Unidom::Action::Subject::Mock',
      reason_id:              SecureRandom.uuid,
      from_state:             'C',
      thru_state:             'A'
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

  end

end
