# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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

timeable_objects = [
  {
    name: 'Orc Herói',
    map_id: 'gef_fild03',
    interval: 3_600_000
  },
  {
    name: 'Maya',
    map_id: 'anthell02 ',
    interval: 7_200_000
  },
  {
    name: 'Maya',
    map_id: 'gld_dun03 ',
    interval: 28_800_000
  },
  {
    name: 'Maya',
    map_id: 'gld_dun02_2',
    interval: 28_800_000
  },
  {
    name: 'Senhor dos Orcs',
    map_id: 'gef_fild10',
    interval: 7_200_000
  },
  {
    name: 'Besouro-ladrão Dourado',
    map_id: 'prt_sewb4',
    interval: 3_600_000
  },
  {
    name: 'Eddga',
    map_id: 'pay_fild10',
    interval: 7_200_000
  },
  {
    name: 'Eddga',
    map_id: 'gld_dun01 ',
    interval: 28_800_000
  }
]

servers = %w[
  bRO-Thor
  bRO-Valhalla
]

member_types = %w[
  Lider
  Vice-lider
  Membro
]

timeable_object_types = %w[
  Quest
  Monstro
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
  Server.create(description: server)
end

puts 'Creating Guild Member Types'
member_types.each do |member_type|
  GuildMemberType.create(description: member_type)
end

puts 'Creating Timable Object Type'
timeable_object_types.each do |timeable_object_type|
  TimeableObjectType.create(description: timeable_object_type)
end

puts 'Creating Timable Objects'
timeable_objects.each do |timeable_object|
  TimeableObject.create(
    user_id: User.pluck(:id).sample,
    map_id: timeable_object[:map_id],
    interval: timeable_object[:interval],
    name: timeable_object[:name]
  )
end

puts 'Creating Guilds'
guilds.each do |guild|
  Guild.create(
    guild_name: guild[:guild_name],
    description: guild[:description]
  )
end
