module Unidom::Action::Concerns::AsStateSubject

  extend ActiveSupport::Concern

  included do |includer|

    has_many :state_transitions, class_name: 'Unidom::Action::StateTransition', as: :subject

  end

  module ClassMethods
  end

end
