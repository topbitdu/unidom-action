describe Unidom::Action::Searching, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      searcher_visitor_id:   SecureRandom.uuid,
      searcher_visitor_type: 'Unidom::Action::Searcher::Mock',
      searcher_party_id:     SecureRandom.uuid,
      searcher_party_type:   'Unidom::Action::SearcherParty::Mock',
      reason_id:             SecureRandom.uuid,
      resource_name:         'users',
      platform_name:         'administration',
      platform_version:      2,
      criteria:              { name: 'admin' },
      found_count:           63,
      shown_count:           10,
      per_page:              10,
      total_pages:           7,
      current_page:          2
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

    it_behaves_like 'belongs_to', model_attributes, :reason, Unidom::Action::Reason, { name: 'Some Reason' }

  end

end
