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

    resource_name_max_length = described_class.columns_hash['resource_name'].limit
    platform_name_max_length = described_class.columns_hash['platform_name'].limit

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

    it_behaves_like 'belongs_to', model_attributes, :reason, Unidom::Action::Reason, { name: 'Some Reason' }

    it_behaves_like 'monomorphic scope', model_attributes, :caused_by, :reason

    it_behaves_like 'validates', model_attributes, :resource_name,
      {                      } => 0,
      { resource_name: nil   } => 1,
      { resource_name: ''    } => 1,
      { resource_name: '1'   } => 0,
      { resource_name: 'A'   } => 0,
      { resource_name: '11'  } => 0,
      { resource_name: 'AA'  } => 0,
      { resource_name: '111' } => 0,
      { resource_name: 'AAA' } => 0,
      { resource_name: '1'*(resource_name_max_length-1) } => 0,
      { resource_name: 'A'*(resource_name_max_length-1) } => 0,
      { resource_name: '1'*resource_name_max_length     } => 0,
      { resource_name: 'A'*resource_name_max_length     } => 0,
      { resource_name: '1'*(resource_name_max_length+1) } => 1,
      { resource_name: 'A'*(resource_name_max_length+1) } => 1

    it_behaves_like 'validates', model_attributes, :platform_name,
      {                      } => 0,
      { platform_name: nil   } => 1,
      { platform_name: ''    } => 1,
      { platform_name: '1'   } => 0,
      { platform_name: 'A'   } => 0,
      { platform_name: '11'  } => 0,
      { platform_name: 'AA'  } => 0,
      { platform_name: '111' } => 0,
      { platform_name: 'AAA' } => 0,
      { platform_name: '1'*(platform_name_max_length-1) } => 0,
      { platform_name: 'A'*(platform_name_max_length-1) } => 0,
      { platform_name: '1'*platform_name_max_length     } => 0,
      { platform_name: 'A'*platform_name_max_length     } => 0,
      { platform_name: '1'*(platform_name_max_length+1) } => 1,
      { platform_name: 'A'*(platform_name_max_length+1) } => 1

    it_behaves_like 'validates', model_attributes, :platform_version,
      {                                   } => 0,
      { platform_version: nil             } => 2,
      { platform_version: ''              } => 2,
      { platform_version: '1'             } => 0,
      { platform_version: 1               } => 0,
      { platform_version: 'A'             } => 1,
      { platform_version: '1.23'          } => 1,
      { platform_version: 1.23            } => 1,
      { platform_version: '-0.01'         } => 1,
      { platform_version: -0.01           } => 1,
      { platform_version: '0'             } => 0,
      { platform_version: 0               } => 0,
      { platform_version: '0.01'          } => 1,
      { platform_version: 0.01            } => 1,
      { platform_version: '999999999'     } => 0,
      { platform_version: 999_999_999     } => 0,
      { platform_version: '1000000000'    } => 0,
      { platform_version: 1_000_000_000   } => 0,
      { platform_version: '1_000_000_001' } => 1,
      { platform_version: 1_000_000_001   } => 1

  end

end
