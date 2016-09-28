# Obsolescence 是废弃。
# #reason 是原因。
# #obsolesced 是被废弃的对象。

class Unidom::Action::Obsolescence < Unidom::Action::ApplicationRecord

  self.table_name = 'unidom_obsolescences'

  include Unidom::Common::Concerns::ModelExtension

  belongs_to :obsolescer_visitor, polymorphic: true
  belongs_to :obsolescer_party,   polymorphic: true
  belongs_to :obsolesced,         polymorphic: true
  belongs_to :reason,             class_name:  'Unidom::Action::Reason'

end
