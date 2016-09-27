class CreateUnidomStateTransitions < ActiveRecord::Migration

  def change

    create_table :unidom_state_transitions, id: :uuid do |t|

      t.references :subject, type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }
      t.references :reason,  type: :uuid, null: true

      t.column :from_state, 'char(1)', null: false, default: 'C'
      t.column :thru_state, 'char(1)', null: false, default: 'C'

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: Time.utc(1970)
      t.datetime :closed_at,        null: false, default: Time.utc(3000)
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_state_transitions, :subject_id
    add_index :unidom_state_transitions, :reason_id

  end

end
