# This migration comes from refinery_checks (originally 1)
class CreateChecksChecks < ActiveRecord::Migration

  def up
    create_table :refinery_checks do |t|
      t.string :title
      t.text :blurb
      t.datetime :date
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-checks"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/checks/checks"})
    end

    drop_table :refinery_checks

  end

end
