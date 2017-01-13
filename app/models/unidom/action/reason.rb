##
# Reason 是行为的原因。
# #activity_code 是活动代码。

class Unidom::Action::Reason < Unidom::Action::ApplicationRecord

  self.table_name = 'unidom_reasons'

  include Unidom::Common::Concerns::ModelExtension

  validates :name, presence: true, length: { in: 2..self.columns_hash['name'].limit }

end
