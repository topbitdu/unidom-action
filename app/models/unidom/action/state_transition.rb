# State Transition 是状态迁移。
# #reason 是原因。
# #subject 是状态的主体。

class Unidom::Action::StateTransition < Unidom::Action::ApplicationRecord

  self.table_name = 'unidom_state_transitions'

  include Unidom::Common::Concerns::ModelExtension

  belongs_to :subject, polymorphic: true
  belongs_to :reason,  class_name:  'Unidom::Action::Reason'

end
