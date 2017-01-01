module Unidom::Action::Concerns::AsSearcherParty

  extend ActiveSupport::Concern

  included do |includer|

    has_many :searched_searchings, class_name: 'Unidom::Action::Searching', as: :searcher_party

    def search!(it, on: '', version: '1', per: {}, due_to: nil, via: nil, at: Time.now, displaying: 0, of_total: 0, on_current_page: 0, of_total_page: 0, per_page: 0)
      searched_searchings.create! resource_name: it, platform_name: on, platform_version: version, criteria: per,
        reason: due_to, searcher_visitor: via, opened_at: at,
        shown_count: displaying, found_count: of_total, current_page: on_current_page, total_pages: of_total_page, per_page: per_page
    end

    def search?(it, on: '', version: '1', due_to: nil, at: Time.now)
      query = searched_searchings
      query = query.resource_name_is    it      if it.present?
      query = query.platform_name_is    on      if on.present?
      query = query.platform_version_is version if version.present?
      query = query.caused_by           due_to  if due_to.present?
      query = query.valid_at            now: at if at.present?
      query.alive.exists?
    end

  end

  module ClassMethods
  end

end
