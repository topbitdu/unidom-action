module Unidom::Action::Concerns::AsObsolescerParty

  extend ActiveSupport::Concern

  included do |includer|

    has_many :obsolesced_obsolescings, class_name: 'Unidom::Action::Obsolescing', as: :obsolescer_party

    def obsolesce!(it, obsolescence_code: 'OBSL', due_to: nil, via: nil, at: Time.now)
      obsolesced_obsolescings.create! obsolesced: it, obsolescence_code: 'OBSL', obsolescer_visitor: via, reason: due_to, opened_at: at
    end

    def obsolesce?(it, obsolescence_code: 'OBSL', due_to: nil, via: nil, at: Time.now)
      query = obsolesced_obsolescings
      query = query.obsolesced_is         it                if it.present?
      query = query.obsolesced_via        via               if via.present?
      query = query.caused_by             due_to            if due_to.present?
      query = query.obsolescence_coded_as obsolescence_code if obsolescence_code.present?
      query = query.valid_at              now: at           if at.present?
      query.alive.exists?
    end

  end

  module ClassMethods
  end

end
