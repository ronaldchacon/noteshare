require 'faker'

ronald = User.first

ronald.notes.create(title: Faker::Hacker.noun, content: Faker::Lorem.paragraphs)