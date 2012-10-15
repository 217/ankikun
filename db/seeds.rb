# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Wiki.create(:close => false,:title => "NEMO",:wiki_id => 0,:wikipage => {:body => "hogehoge",:owner_id => 0,:page_id => 0, :title => "hoge"})
