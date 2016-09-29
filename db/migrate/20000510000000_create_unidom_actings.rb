class CreateUnidomActings < ActiveRecord::Migration

  def change

    create_table :unidom_actings, id: :uuid do |t|

      t.references :actor_visitor, type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }
      t.references :actor_party,   type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }
      t.references :acted,         type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }
      t.references :reason,        type: :uuid, null: true

      t.column :action_code, 'char(1)', null: false, default: 'C'

      t.jsonb :from_value, null: false, default: {}
      t.jsonb :thru_value, null: false, default: {}

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: Time.utc(1970)
      t.datetime :closed_at,        null: false, default: Time.utc(3000)
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_actings, :actor_visitor_id
    add_index :unidom_actings, :actor_party_id
    add_index :unidom_actings, :acted_id
    add_index :unidom_actings, :reason_id

  end

end
