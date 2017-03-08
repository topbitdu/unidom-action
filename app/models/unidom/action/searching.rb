##
# Searching 是行为的原因。
# #activity_code 是活动代码。

class Unidom::Action::Searching < Unidom::Action::ApplicationRecord

  self.table_name = 'unidom_searchings'

  include Unidom::Common::Concerns::ModelExtension

  validates :resource_name,    presence: true, length: { maximum: self.columns_hash['resource_name'].limit }
  validates :platform_name,    presence: true, length: { maximum: self.columns_hash['platform_name'].limit }
  validates :platform_version, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 1_000_000_000 }

  validates :found_count,   presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 1_000_000_000 }
  validates :shown_count,   presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 1_000_000_000 }
  validates :per_page,      presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 1_000_000_000 }
  validates :total_pages,   presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 1_000_000_000 }
  validates :current_page,  presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 1_000_000_000 }

  belongs_to :searcher_visitor, polymorphic: true
  belongs_to :searcher_party,   polymorphic: true
  belongs_to :reason,           class_name:  'Unidom::Action::Reason'

  scope :searched_by,  ->(searcher_party)   { where searcher_party:   searcher_party   }
  scope :searched_via, ->(searcher_visitor) { where searcher_visitor: searcher_visitor }
  scope :caused_by,    ->(reason)           { where reason_id:        to_id(reason)    }

  scope :resource_name_is,    ->(resource_name)    { where resource_name:    resource_name    }
  scope :platform_name_is,    ->(platform_name)    { where platform_name:    platform_name    }
  scope :platform_version_is, ->(platform_version) { where platform_version: platform_version }

  scope :found_count_is,  ->(found_count)  { where found_count:  found_count  }
  scope :shown_count_is,  ->(shown_count)  { where shown_count:  shown_count  }
  scope :per_page_is,     ->(per_page)     { where per_page:     per_page     }
  scope :current_page_is, ->(current_page) { where current_page: current_page }
  scope :total_pages_is,  ->(total_pages)  { where total_pages:  total_pages  }

  def self.search!(it, on: '', version: '1', per: {}, due_to: nil, by: nil, via: nil, at: Time.now, displaying: 0, of_total: 0, on_current_page: 0, of_total_page: 0, per_page: 0)
    create! resource_name: it, platform_name: on, platform_version: version, criteria: per,
      reason: due_to, searcher_party: by, searcher_visitor: via, opened_at: at,
      shown_count: displaying, found_count: of_total, current_page: on_current_page, total_pages: of_total_page, per_page: per_page
  end

end unless Unidom::Common::Neglection.namespace_neglected? 'Unidom::Action::Searching'
