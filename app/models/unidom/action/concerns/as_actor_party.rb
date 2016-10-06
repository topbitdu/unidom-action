module Unidom::Action::Concerns::AsActorParty

  extend ActiveSupport::Concern

  included do |includer|

    has_many :acted_actings, class_name: 'Unidom::Action::Acting', as: :actor_party

  end

  module ClassMethods
  end

end
