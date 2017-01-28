describe Unidom::Action::Action, type: :type do

  before :each do
  end

  after :each do
  end

  it_behaves_like 'ProgneTapera::EnumConfig', 5, [
    { code: 'C', name: 'create',  localized_name: '创建' },
    { code: 'D', name: 'destroy', localized_name: '销毁' },
    { code: 'I', name: 'index',   localized_name: '检索' },
    { code: 'S', name: 'show',    localized_name: '显示' },
    { code: 'U', name: 'update',  localized_name: '更新' } ]

end
