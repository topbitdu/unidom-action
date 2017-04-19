module Unidom::Action::Concerns::AsStateSubject

  extend  ActiveSupport::Concern
  include Unidom::Common::Concerns::ArgumentValidation

  included do |includer|

    has_many :state_transitions, class_name: 'Unidom::Action::StateTransition', as: :subject

    def is_transited!(from: nil, thru: nil, due_to: nil, via: nil, by: nil, at: Time.now)

      assert_present! :from, from

      state_transitions.create! from_state: from, thru_state: thru, transitor_visitor: via, transitor_party: by, reason: due_to, opened_at: at

    end

    def is_transited?(from: nil, thru: nil, due_to: nil, via: nil, by: nil, at: Time.now)
      query = state_transitions
      query = query.transited_by      by      if by.present?
      query = query.transited_via     via     if via.present?
      query = query.from_transited_to from    if from.present?
      query = query.thru_transited_to thru    if thru.present?
      query = query.caused_by         due_to  if due_to.present?
      query = query.valid_at          now: at if at.present?
      query.exists?
    end

  end

  module ClassMethods
  end

end
