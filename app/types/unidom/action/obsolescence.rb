class Unidom::Action::Obsolescence < ActiveRecord::Type::Value

  include ProgneTapera::EnumConfig

  enum :unidom_obsolescence

end
