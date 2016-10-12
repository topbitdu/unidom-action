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

  scope :acted_via, ->(actor_visitor) { where actor_visitor: actor_visitor }
  scope :acted_by,  ->(actor_party)   { where actor_party:   actor_party   }
  scope :acted_is,  ->(acted)         { where acted:         acted         }
  scope :caused_by, ->(reason)        { where reason_id:     to_id(reason) }

  def self.act!(it, from: nil, thru: nil, due_to: nil, by: nil, via: nil, at: Time.now, action_code: 'C')
    create! from_value: from, thru_value: thru, actor_visitor: via, actor_party: by, acted: it, reason: due_to, action_code: action_code, opened_at: at
  end

end
