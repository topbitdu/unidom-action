module Unidom::Action::Concerns::AsActed

  extend ActiveSupport::Concern

  included do |includer|

    has_many :actings, class_name: 'Unidom::Action::Acting', as: :acted

  end

  module ClassMethods
  end

end
