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

    it_behaves_like 'validates', model_attributes, :found_count,
      {                              } => 0,
      { found_count: nil             } => 2,
      { found_count: ''              } => 2,
      { found_count: '1'             } => 0,
      { found_count: 1               } => 0,
      { found_count: 'A'             } => 1,
      { found_count: '1.23'          } => 1,
      { found_count: 1.23            } => 1,
      { found_count: '-0.01'         } => 1,
      { found_count: -0.01           } => 1,
      { found_count: '0'             } => 0,
      { found_count: 0               } => 0,
      { found_count: '0.01'          } => 1,
      { found_count: 0.01            } => 1,
      { found_count: '999999999'     } => 0,
      { found_count: 999_999_999     } => 0,
      { found_count: '1000000000'    } => 0,
      { found_count: 1_000_000_000   } => 0,
      { found_count: '1_000_000_001' } => 1,
      { found_count: 1_000_000_001   } => 1

    it_behaves_like 'validates', model_attributes, :shown_count,
      {                              } => 0,
      { shown_count: nil             } => 2,
      { shown_count: ''              } => 2,
      { shown_count: '1'             } => 0,
      { shown_count: 1               } => 0,
      { shown_count: 'A'             } => 1,
      { shown_count: '1.23'          } => 1,
      { shown_count: 1.23            } => 1,
      { shown_count: '-0.01'         } => 1,
      { shown_count: -0.01           } => 1,
      { shown_count: '0'             } => 0,
      { shown_count: 0               } => 0,
      { shown_count: '0.01'          } => 1,
      { shown_count: 0.01            } => 1,
      { shown_count: '999999999'     } => 0,
      { shown_count: 999_999_999     } => 0,
      { shown_count: '1000000000'    } => 0,
      { shown_count: 1_000_000_000   } => 0,
      { shown_count: '1_000_000_001' } => 1,
      { shown_count: 1_000_000_001   } => 1

    it_behaves_like 'validates', model_attributes, :per_page,
      {                           } => 0,
      { per_page: nil             } => 2,
      { per_page: ''              } => 2,
      { per_page: '1'             } => 0,
      { per_page: 1               } => 0,
      { per_page: 'A'             } => 1,
      { per_page: '1.23'          } => 1,
      { per_page: 1.23            } => 1,
      { per_page: '-0.01'         } => 1,
      { per_page: -0.01           } => 1,
      { per_page: '0'             } => 0,
      { per_page: 0               } => 0,
      { per_page: '0.01'          } => 1,
      { per_page: 0.01            } => 1,
      { per_page: '999999999'     } => 0,
      { per_page: 999_999_999     } => 0,
      { per_page: '1000000000'    } => 0,
      { per_page: 1_000_000_000   } => 0,
      { per_page: '1_000_000_001' } => 1,
      { per_page: 1_000_000_001   } => 1

    it_behaves_like 'validates', model_attributes, :total_pages,
      {                              } => 0,
      { total_pages: nil             } => 2,
      { total_pages: ''              } => 2,
      { total_pages: '1'             } => 0,
      { total_pages: 1               } => 0,
      { total_pages: 'A'             } => 1,
      { total_pages: '1.23'          } => 1,
      { total_pages: 1.23            } => 1,
      { total_pages: '-0.01'         } => 1,
      { total_pages: -0.01           } => 1,
      { total_pages: '0'             } => 0,
      { total_pages: 0               } => 0,
      { total_pages: '0.01'          } => 1,
      { total_pages: 0.01            } => 1,
      { total_pages: '999999999'     } => 0,
      { total_pages: 999_999_999     } => 0,
      { total_pages: '1000000000'    } => 0,
      { total_pages: 1_000_000_000   } => 0,
      { total_pages: '1_000_000_001' } => 1,
      { total_pages: 1_000_000_001   } => 1

    it_behaves_like 'validates', model_attributes, :current_page,
      {                               } => 0,
      { current_page: nil             } => 2,
      { current_page: ''              } => 2,
      { current_page: '1'             } => 0,
      { current_page: 1               } => 0,
      { current_page: 'A'             } => 1,
      { current_page: '1.23'          } => 1,
      { current_page: 1.23            } => 1,
      { current_page: '-0.01'         } => 1,
      { current_page: -0.01           } => 1,
      { current_page: '0'             } => 0,
      { current_page: 0               } => 0,
      { current_page: '0.01'          } => 1,
      { current_page: 0.01            } => 1,
      { current_page: '999999999'     } => 0,
      { current_page: 999_999_999     } => 0,
      { current_page: '1000000000'    } => 0,
      { current_page: 1_000_000_000   } => 0,
      { current_page: '1_000_000_001' } => 1,
      { current_page: 1_000_000_001   } => 1

  end

end
