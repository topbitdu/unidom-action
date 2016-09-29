# Acting 是行为记录。
# #reason 是原因。
# #acted 是被操作的对象。
# #action_code 是行为代码，C: create, R: read, U: update, D: destroy。

class Unidom::Action::Acting < Unidom::Action::ApplicationRecord

  self.table_name = 'unidom_actings'

  include Unidom::Common::Concerns::ModelExtension

  belongs_to :actor_visitor, polymorphic: true
  belongs_to :actor_party,   polymorphic: true
  belongs_to :acted,         polymorphic: true
  belongs_to :reason,        class_name:  'Unidom::Action::Reason'

end
