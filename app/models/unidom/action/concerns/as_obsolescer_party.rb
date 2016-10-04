module Unidom::Action::Concerns::AsObsolescerParty

  extend ActiveSupport::Concern

  included do |includer|

    has_many :obsolesced_obsolescings, class_name: 'Unidom::Action::Obsolescing', as: :obsolescer_party

  end

  module ClassMethods
  end

end
