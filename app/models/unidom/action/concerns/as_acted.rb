module Unidom::Action::Concerns::AsActed

  extend ActiveSupport::Concern

  included do |includer|

    has_many :actings, class_name: 'Unidom::Action::Acting', as: :acted

    def is_acted!(from: nil, thru: nil, due_to: nil, by: nil, via: nil, at: Time.now, action_code: 'C')
      actings.create! from_value: from, thru_value: thru, actor_visitor: via, actor_party: by, acted: self, reason: due_to, action_code: action_code, opened_at: at
    end

    def is_acted?(due_to: nil, by: nil, via: nil, at: Time.now, action_code: 'C')
      query = actings.acted_is      self
      query = query.acted_via       via         if via.present?
      query = query.acted_by        by          if by.present?
      query = query.caused_by       due_to      if due_to.present?
      query = query.action_coded_as action_code if action_code.present?
      query = query.valid_at        now: at     if at.present?
      query = query.alive.exists?
    end

  end

  module ClassMethods
  end

end
