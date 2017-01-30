describe Unidom::Action::Obsolescence, type: :type do

  before :each do
  end

  after :each do
  end

  it_behaves_like 'ProgneTapera::EnumConfig', 2, [
    { code: 'OBSL', name: 'obsolesce', localized_name: '过期' },
    { code: 'RCVR', name: 'recover',   localized_name: '恢复' } ]

end
