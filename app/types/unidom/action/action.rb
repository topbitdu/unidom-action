class Unidom::Action::Action < ActiveRecord::Type::Value

  include ProgneTapera::EnumConfig

  enum :unidom_action

end
