module Unidom::Action::Concerns::AsActorParty

  extend ActiveSupport::Concern

  included do |includer|

    has_many :acted_actings, class_name: 'Unidom::Action::Acting', as: :actor_party

    def act!(on: nil, from: nil, thru: nil, due_to: nil, via: nil, at: Time.now, action_code: 'C')
      acted_actings.create! acted: on, from_value: from, thru_value: thru, reason: due_to, actor_visitor: via, opened_at: at, action_code: action_code
    end

=begin
    def act?(on: nil, due_to: nil, via: nil, at: Time.now, action_code: 'C')
      query = acted_actings
      query = query.acted_is        on          if on.present?
      query = query.acted_via       via         if via.present?
      query = query.action_coded_as action_code if action_code.present?
      query = query.valid_at        now: at     if at.present?
      query = query.caused_by       due_to      if due_to.present?
      query.alive.exists?
    end
=end

  end

  module ClassMethods
  end

end
