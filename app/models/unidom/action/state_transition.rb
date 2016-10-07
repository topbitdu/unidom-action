# State Transition 是状态迁移。
# #reason 是原因。
# #subject 是状态的主体。

class Unidom::Action::StateTransition < Unidom::Action::ApplicationRecord

  self.table_name = 'unidom_state_transitions'

  include Unidom::Common::Concerns::ModelExtension

  belongs_to :transitor_visitor, polymorphic: true
  belongs_to :transitor_party,   polymorphic: true
  belongs_to :subject,           polymorphic: true
  belongs_to :reason,            class_name:  'Unidom::Action::Reason'

  def self.transit!(subject: nil, from_state: nil, thru_state: nil, transitor_visitor: nil, transitor_party: nil, reason: nil, opened_at: Time.now)
    create! transitor_visitor: transitor_visitor, transitor_party: transitor_party, subject: subject, reason: reason, from_state: from_state, thru_state: thru_state, opened_at: opened_at
  end

end
