# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

@doc=Nokogiri::XML(open("http://www.kinoballada.info/repertuar/export/small/dzien/xml"))
@doc.css('dzien').each do |node|
	children=node.children
Movie.create(
	:name => children.css('tytul').inner_text
)

users = User.create(

    [
        {
            index: '123456',
            name: 'Tomek',
            password: 'haslo123'
        },
        {
            index: '654321',
            name: 'Patryk',
            password: 'haslo123'
        }
    ]
)

movies = Movie.create(
    [
        {
            name:'Star Wars'
        },
        {
            name:'Władca pierścieni'
        }
    ])

topics = Topic.create(
    [
        {
            title:' Han Solo zginie',
            user: users.first,
            movie: movies.first
        },
        {
            title:'You shall not pass!',
            user: users.last,
            movie: movies.last
        }
    ]
    )

posts = Post.create(
    [
        {
            body:'Jebane Spoiler!',
            user:users.last,
            topic:topics.first
        },
        {
            body:'Gandalf',
            user:users.first,
            topic:topics.last
        }
    ]
    )

users.first.movies = movies

end
