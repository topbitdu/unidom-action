class CreateUnidomSearchings < ActiveRecord::Migration

  def change

    create_table :unidom_searchings, id: :uuid do |t|

      t.references :searcher_visitor, type: :uuid, null: true,
        polymorphic: { null: true, default: nil, limit: 200 }
      t.references :searcher_party,   type: :uuid, null: true,
        polymorphic: { null: true, default: nil, limit: 200 }
      t.references :reason,           type: :uuid, null: true

      t.string  :resource_name,    null: false, default: '', limit: 200
      t.string  :platform_name,    null: false, default: '', limit: 200
      t.integer :platform_version, null: false, default: 1

      t.jsonb   :criteria,     null: false, default: {}
      t.integer :found_count,  null: false, default: 0, limit: 8
      t.integer :shown_count,  null: false, default: 0
      t.integer :per_page,     null: false, default: 0
      t.integer :total_pages,  null: false, default: 0
      t.integer :current_page, null: false, default: 1

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: Time.utc(1970)
      t.datetime :closed_at,        null: false, default: Time.utc(3000)
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_searchings, :searcher_visitor_id
    add_index :unidom_searchings, :searcher_party_id
    add_index :unidom_searchings, :reason_id

  end

end
