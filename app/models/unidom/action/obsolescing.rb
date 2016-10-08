# Obsolescing 是废弃。
# #reason 是原因。
# #obsolesced 是被废弃的对象。
# #obsolescence_code 是废弃代码，OBSL 表示废弃， RCVR 表示恢复。

class Unidom::Action::Obsolescing < Unidom::Action::ApplicationRecord

  self.table_name = 'unidom_obsolescings'

  include Unidom::Common::Concerns::ModelExtension

  belongs_to :obsolescer_visitor, polymorphic: true
  belongs_to :obsolescer_party,   polymorphic: true
  belongs_to :obsolesced,         polymorphic: true
  belongs_to :reason,             class_name:  'Unidom::Action::Reason'

  def self.obsolesce!(obsolesced: nil, obsolescer_visitor: nil, obsolescer_party: nil, reason: nil, obsolescence_code: 'OBSL', opened_at: Time.now)
    create! obsolesced: obsolesced, obsolescer_visitor: obsolescer_visitor, obsolescer_party: obsolescer_party, reason: reason, obsolescence_code: obsolescence_code, opened_at: opened_at
  end

end
