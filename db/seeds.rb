# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed

# Added by Refinery CMS Services extension
Refinery::Services::Engine.load_seed

# Added by Refinery CMS Technologies extension
Refinery::Technologies::Engine.load_seed

# Added by Refinery CMS Requirements extension
Refinery::Requirements::Engine.load_seed

# Added by Refinery CMS Verticals extension
Refinery::Verticals::Engine.load_seed

# Added by Refinery CMS Tranings extension
Refinery::Tranings::Engine.load_seed

# Added by Refinery CMS Checks extension
Refinery::Checks::Engine.load_seed
