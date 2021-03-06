module Unidom::Action::Concerns::AsObsolesced

  extend  ActiveSupport::Concern
  include Unidom::Common::Concerns::ArgumentValidation

  included do |includer|

    has_many :obsolescings, class_name: 'Unidom::Action::Obsolescing', as: :obsolesced

    def is_obsolesced!(obsolescence_code: 'OBSL', due_to: nil, via: nil, by: nil, at: Time.now)

      assert_present! :obsolescence_code, obsolescence_code
      assert_present! :via,               via
      assert_present! :by,                by
      assert_present! :at,                at

      obsolescings.create! obsolescence_code: 'OBSL', obsolescer_visitor: via, obsolescer_party: by, reason: due_to, opened_at: at

    end

    def is_obsolesced?(obsolescence_code: 'OBSL', due_to: nil, via: nil, by: nil, at: Time.now)
      query = obsolescings
      query = query.obsolescence_coded_as obsolescence_code if obsolescence_code.present?
      query = query.obsolesced_by         by                if by.present?
      query = query.obsolesced_via        via               if via.present?
      query = query.caused_by             due_to            if due_to.present?
      query = query.valid_at              now: at           if at.present?
      query.exists?
    end

  end

  module ClassMethods
  end

end
