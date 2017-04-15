shared_examples 'Unidom::Action::Concerns::AsSearcherParty' do |model_attributes|

  context do

    searching_1_attributes = {
      searcher_visitor_id:   SecureRandom.uuid,
      searcher_visitor_type: 'Unidom::Action::SearcherVisitor::Mock',
      reason_id:             SecureRandom.uuid,
      resource_name:         'articles',
      platform_name:         'customer',
      platform_version:      1,
      criteria:              { keyword: 'Title' },
      found_count:           18,
      shown_count:           10,
      per_page:              10,
      total_pages:           2,
      current_page:          1
    }

    searching_2_attributes = {
      searcher_visitor_id:   SecureRandom.uuid,
      searcher_visitor_type: 'Unidom::Action::SearcherVisitor::Mock',
      reason_id:             SecureRandom.uuid,
      resource_name:         'comments',
      platform_name:         'administration',
      platform_version:      2,
      criteria:              { keyword: 'Comment' },
      found_count:           28,
      shown_count:           8,
      per_page:              10,
      total_pages:           3,
      current_page:          3
    }

    it_behaves_like 'has_many', model_attributes, :searched_searchings, Unidom::Action::Searching, [ searching_1_attributes, searching_2_attributes ]

  end

end
