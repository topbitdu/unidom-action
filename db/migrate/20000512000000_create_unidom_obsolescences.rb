class CreateUnidomObsolescences < ActiveRecord::Migration

  def change

    create_table :unidom_obsolescences, id: :uuid do |t|

      t.references :obsolescer_visitor, type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }
      t.references :obsolescer_party,   type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }
      t.references :obsolesced,         type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }
      t.references :reason,             type: :uuid, null: true

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: Time.utc(1970)
      t.datetime :closed_at,        null: false, default: Time.utc(3000)
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_obsolescences, :obsolescer_visitor_id
    add_index :unidom_obsolescences, :obsolescer_party_id
    add_index :unidom_obsolescences, :obsolesced_id
    add_index :unidom_obsolescences, :reason_id

  end

end
