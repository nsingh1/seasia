class CreateRequirementsRequirements < ActiveRecord::Migration

  def up
    create_table :refinery_requirements do |t|
      t.string :language
      t.text :blurb
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-requirements"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/requirements/requirements"})
    end

    drop_table :refinery_requirements

  end

end
