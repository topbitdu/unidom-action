module Unidom::Action::Concerns::AsStateTransitorParty

  extend ActiveSupport::Concern

  included do |includer|

    has_many :transited_state_transitions, class_name: 'Unidom::Action::StateTransition', as: :transitor_party

  end

  module ClassMethods
  end

end
