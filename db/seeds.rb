# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([
                        {
                            email: 'test-user-00@mail.com',
                            name: 'test-user-00',
                            activated: DateTime.now,
                            admin: false
                        },
                        {
                            email: 'test-user-01@mail.com',
                            name: 'test-user-01',
                            activated: DateTime.now,
                            admin: false
                        }
                    ])
 100.times do |i|
   Student.create(
                      {
                          name: "test-user-00#{i}",
                          sex: 'male'
                      }
                  )
 end
