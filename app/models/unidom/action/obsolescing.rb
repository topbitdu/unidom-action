##
# Obsolescing 是废弃。
# #reason 是原因。
# #obsolesced 是被废弃的对象。
# #obsolescence_code 是废弃代码，OBSL 表示废弃， RCVR 表示恢复。

class Unidom::Action::Obsolescing < Unidom::Action::ApplicationRecord

  self.table_name = 'unidom_obsolescings'

  include Unidom::Common::Concerns::ModelExtension
  include ProgneTapera::EnumCode
  include Unidom::Action::Concerns::AsCaused

  belongs_to :obsolescer_visitor, polymorphic: true
  belongs_to :obsolescer_party,   polymorphic: true
  belongs_to :obsolesced,         polymorphic: true

  scope :obsolesced_via, ->(obsolescer_visitor) { where obsolescer_visitor: obsolescer_visitor }
  scope :obsolesced_by,  ->(obsolescer_party)   { where obsolescer_party:   obsolescer_party   }
  scope :obsolesced_is,  ->(obsolesced)         { where obsolesced:         obsolesced         }

  code :obsolescence, Unidom::Action::Obsolescence

  def self.obsolesce!(obsolesced: nil, obsolescer_visitor: nil, obsolescer_party: nil, reason: nil, obsolescence_code: 'OBSL', opened_at: Time.now)
    create! obsolesced: obsolesced, obsolescer_visitor: obsolescer_visitor, obsolescer_party: obsolescer_party, reason: reason, obsolescence_code: obsolescence_code, opened_at: opened_at
  end

end unless Unidom::Common::Neglection.namespace_neglected? 'Unidom::Action::Obsolescing'
