describe Unidom::Action::Reason, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      name:          'Reason #1',
      activity_code: 'ZZZZ'
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

  end

end
