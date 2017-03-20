module Unidom::Action::Concerns::AsCaused

  extend ActiveSupport::Concern

  included do |includer|

    belongs_to :reason, class_name: 'Unidom::Action::Reason'

    scope :caused_by, ->(reason) { where reason_id: to_id(reason) }

  end

  module ClassMethods
  end

end
