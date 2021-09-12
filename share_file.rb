

require "open-uri"

file = URI.open('https://res.cloudinary.com/mvtimer/image/upload/v1631415436/70_ybt5p9.gif')
TimeableObject.last.photo.attach(io: file, filename: 'test.gif', content_type: 'image/gif')

file = URI.open('https://res.cloudinary.com/mvtimer/image/upload/v1631415436/70_ybt5p9.gif')
TimeableObject.last.photo.attach(io: URI.open(), filename: 'test.gif', content_type: 'image/gif')