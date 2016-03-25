require 'faker'
#Creates Topics
20.times do
  t = Topic.new
  t.title = Faker::Beer.name

  t.save!
end

#Creates Bookmarks
topics = Topic.all

50.times do
  b = Bookmark.create!(
  url: Faker::Internet.domain_name,
  topic: topics.sample
  )
  b.save!
end

puts "#{Topic.count} Topics Seeded"
puts "#{Bookmark.count} Bookmarks Seeded"
