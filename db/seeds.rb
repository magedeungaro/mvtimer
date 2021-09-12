# frozen_string_literal: true

require 'json'
require 'open-uri'

timeable_objects_serialized = File.read('/home/johngvc/code/johngvc/projects/mvtimer/db/monsters.json')
timeable_objects = JSON.parse(timeable_objects_serialized).map(&:symbolize_keys)

users = [
  {
    email: 'a@a.com',
    password: '1234',
    first_name: 'a',
    user_nickname: 'a'
  },
  {
    email: 'b@b.com',
    password: '1234',
    first_name: 'b',
    user_nickname: 'b'
  },
  {
    email: 'c@c.com',
    password: '1234',
    first_name: 'c',
    user_nickname: 'c'
  }
]

account_tier_types = [
  {
    title: 'Slime',
    description: [
      'Criar custom cards (quest)',
      'Estatiscas basicas sobre caçadas',
      'Estatisticas de performance própria'
    ],
    price: 0,
    status: true
  },
  {
    title: 'Mini Boss',
    description: [
      'Criar e salvar custom cards (Monstro)',
      'Estatisticas sobre monstros'
    ],
    price: 5.99,
    status: true
  },
  {
    title: 'MVP',
    description: [
      'Criar clã',
      'Compartilhar cards',
      'Estatisticas de performance do clã',
      'Ranking de clãs'
    ],
    price: 14.99,
    status: true
  }
]

servers = [
  {
    description: 'bRO-Thor',
    timezone: 'America/Sao_Paulo'
  },
  {
    description: 'bRO-Valhalla',
    timezone: 'America/Sao_Paulo'
  }
]

member_types = %w[
  Lider
  Vice-lider
  Membro
]

guilds = [
  {
    guild_name: 'CuteGuild',
    description: 'A cute guild'
  },
  {
    guild_name: 'OnlyYouAndI',
    description: 'A guild for only Mage and John'
  }
]

puts 'Creating Account Tier Types'
account_tier_types.each do |account_tier_type|
  AccountTierType.create(
    title: account_tier_type[:title],
    description: account_tier_type[:description],
    price: account_tier_type[:price],
    status: account_tier_type[:status]
  )
end

puts 'Creating Users'
users.each do |user|
  User.create(
    email: user[:email],
    password: user[:password],
    first_name: user[:first_name],
    user_nickname: user[:user_nickname],
    account_tier_type_id: AccountTierType.pluck(:id).sample
  )
end

puts 'Creating servers'
servers.each do |server|
  Server.create(
    description: server[:description],
    timezone: server[:timezone]
  )
end

puts 'Creating Guild Member Types'
member_types.each do |member_type|
  GuildMemberType.create(description: member_type)
end

puts 'Creating Timeable Objects'
timeable_objects.each do |timeable_object|
  timeable_object_instance = TimeableObject.new(
    user_id: User.pluck(:id).sample,
    map_id: timeable_object[:map_id],
    interval: timeable_object[:interval] / 1000,
    name: timeable_object[:name]
  )

  timeable_object_instance.photo.attach(
    io: URI.open(timeable_object[:photo]),
    filename: "#{timeable_object[:name]}.gif",
    content_type: 'image/gif'
  )
  timeable_object_instance.save!
end

puts 'Creating Guilds'
guilds.each do |guild|
  Guild.create(
    guild_name: guild[:guild_name],
    description: guild[:description]
  )
end

puts 'Creating Timeable Object Logs'
TimeableObject.all.each do |timeable_object|
  timeable_object_log = TimeableObjectLog.new(
    killed_by_user: false,
    timeable_object_id: timeable_object.id,
    description: 'xx',
    server_id: 1,
    guild_id: 1,
    user_id: User.pluck(:id).sample
  )

  random_hour = "#{rand(0..23)}:#{rand(0..59)}"
  timeable_object_log.calculate_deadline(random_hour)
  timeable_object_log.save!
end
