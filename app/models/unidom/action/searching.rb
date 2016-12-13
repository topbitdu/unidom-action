# Searching 是行为的原因。
# #activity_code 是活动代码。

class Unidom::Action::Searching < Unidom::Action::ApplicationRecord

  self.table_name = 'unidom_searchings'

  include Unidom::Common::Concerns::ModelExtension

  validates :resource_name, presence: true, length: { maximum: self.columns_hash['resource_name'].limit }
  validates :found_count,   presence: true, numericality: { integer_only: true, greater_than_or_equal_to: 0, less_than: 1_000_000_000 }
  validates :shown_count,   presence: true, numericality: { integer_only: true, greater_than_or_equal_to: 0, less_than: 1_000_000_000 }
  validates :per_page,      presence: true, numericality: { integer_only: true, greater_than_or_equal_to: 0, less_than: 1_000_000_000 }
  validates :total_pages,   presence: true, numericality: { integer_only: true, greater_than_or_equal_to: 0, less_than: 1_000_000_000 }
  validates :current_page,  presence: true, numericality: { integer_only: true, greater_than_or_equal_to: 0, less_than: 1_000_000_000 }

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

  # search! 'books', due_to: some_reason, by: tom, via: toms_account, at: Time.now,
  #   displaying: 10, items_on_page: 3, of: 63, items_and: 7, pages_in_total
  def self.search!(it, due_to: nil, by: nil, via: nil, at: Time.now, displaying: 0, items_on_page: 0, shown_count: 0, of: 0)
    self.create! resource_name: it, reason: due_to, by: searcher_party, via: searcher_visitor, opened_at: at,
      shown_count: displaying, current_page: items_on_page, found_count: of, total_page: items_and,
  end

end
