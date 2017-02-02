describe Unidom::Action::Acting, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      actor_visitor_id:   SecureRandom.uuid,
      actor_visitor_type: 'Unidom::Action::ActorVisitor::Mock',
      actor_party_id:     SecureRandom.uuid,
      actor_party_type:   'Unidom::Action::ActorParty::Mock',
      acted_id:           SecureRandom.uuid,
      acted_type:         'Unidom::Action::Acted::Mock',
      reason_id:          SecureRandom.uuid,
      action_code:        'C',
      from_value:         {},
      thru_value:         {}
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

  end

end
