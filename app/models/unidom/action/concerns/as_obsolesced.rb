module Unidom::Action::Concerns::AsObsolesced

  extend ActiveSupport::Concern

  included do |includer|

    has_many :obsolescings, class_name: 'Unidom::Action::Obsolescing', as: :obsolesced

  end

  module ClassMethods
  end

end
