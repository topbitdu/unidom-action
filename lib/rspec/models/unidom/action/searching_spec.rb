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
    it_behaves_like 'Unidom::Action::Concerns::AsCaused',       model_attributes

    it_behaves_like 'validates text', model_attributes, :resource_name,
      length: 1..described_class.columns_hash['resource_name'].limit

    it_behaves_like 'validates text', model_attributes, :platform_name,
      length: 1..described_class.columns_hash['platform_name'].limit

    it_behaves_like 'validates numericality', model_attributes, :platform_version,
      range: 0..1_000_000_000, minimum_inclusive: true, maximum_inclusive: true, only_integer: true

    it_behaves_like 'validates numericality', model_attributes, :found_count,
      range: 0..1_000_000_000, minimum_inclusive: true, maximum_inclusive: true, only_integer: true

    it_behaves_like 'validates numericality', model_attributes, :shown_count,
      range: 0..1_000_000_000, minimum_inclusive: true, maximum_inclusive: true, only_integer: true

    it_behaves_like 'validates numericality', model_attributes, :per_page,
      range: 0..1_000_000_000, minimum_inclusive: true, maximum_inclusive: true, only_integer: true

    it_behaves_like 'validates numericality', model_attributes, :total_pages,
      range: 0..1_000_000_000, minimum_inclusive: true, maximum_inclusive: true, only_integer: true

    it_behaves_like 'validates numericality', model_attributes, :current_page,
      range: 0..1_000_000_000, minimum_inclusive: true, maximum_inclusive: true, only_integer: true

  end

end
