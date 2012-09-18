# This migration comes from refinery_tranings (originally 1)
class CreateTraningsTranings < ActiveRecord::Migration

  def up
    create_table :refinery_tranings do |t|
      t.string :title
      t.text :blurb
      t.datetime :date
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-tranings"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/tranings/tranings"})
    end

    drop_table :refinery_tranings

  end

end
