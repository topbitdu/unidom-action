shared_examples 'Unidom::Action::Concerns::AsCaused' do |model_attributes|

  context do

    it_behaves_like 'belongs_to', model_attributes, :reason, Unidom::Action::Reason, { name: 'Some Reason' }

    it_behaves_like 'monomorphic scope', model_attributes, :caused_by, :reason

  end

end
