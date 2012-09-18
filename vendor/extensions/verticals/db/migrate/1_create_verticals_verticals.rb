class CreateVerticalsVerticals < ActiveRecord::Migration

  def up
    create_table :refinery_verticals do |t|
      t.string :title
      t.text :blurb
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-verticals"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/verticals/verticals"})
    end

    drop_table :refinery_verticals

  end

end
