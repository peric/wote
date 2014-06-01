# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Website.create([
  { url: 'http://www.google.com/', category: 'test_category' },
  { url: 'http://www.najdi.si/', category: 'test_category' },
  { url: 'http://www.fri.uni-lj.si/', category: 'test_category' },
  { url: 'http://www.stackoverflow.com/', category: 'test_category' },
  { url: 'http://www.twitter.com/', category: 'test_category' },
  { url: 'http://www.last.fm/', category: 'test_category' },
  { url: 'http://www.coderwall.com/', category: 'test_category' },
  { url: 'http://www.kinosiska.si/', category: 'test_category' },
  { url: 'http://www.moonleerecords.com/', category: 'test_category' }
               ])

# TODO: import websites through csv file
