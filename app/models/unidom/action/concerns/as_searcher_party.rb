module Unidom::Action::Concerns::AsSearcherParty

  extend ActiveSupport::Concern

  included do |includer|

    has_many :searched_searchings, class_name: 'Unidom::Action::Searching', as: :searcher_party

  end

  module ClassMethods
  end

end
