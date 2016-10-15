module Unidom::Action::Concerns::AsStateTransitorParty

  extend ActiveSupport::Concern

  included do |includer|

    has_many :transited_state_transitions, class_name: 'Unidom::Action::StateTransition', as: :transitor_party

    def transit!(it, from: nil, thru: nil, due_to: nil, via: nil, at: Time.now)
      transited_state_transitions.create! subject: it, from_state: from, thru_state: thru, transitor_visitor: via, reason: due_to, opened_at: at
    end

    def transit?(it, from: nil, thru: nil, due_to: nil, via: nil, at: Time.now)
      query = transited_state_transitions
      query = query.subject_is        it      if it.present?
      query = query.transited_via     via     if via.present?
      query = query.from_transited_to from    if from.present?
      query = query.thru_transited_to thru    if thru.present?
      query = query.caused_by         due_to  if due_to.present?
      query = query.valid_at          now: at if at.present?
      query.alive.exists?
    end

  end

  module ClassMethods
  end

end
