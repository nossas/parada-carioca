require 'machinist/active_record'

# Add your blueprints here.
#
# e.g.
#   Post.blueprint do
#     title { "Post #{sn}" }
#     body  { "Lorem ipsum..." }
#   end

Activity.blueprint do
  name        { "Pular da Pedra da Gávea de asa-delta" }
  description { "Lorem ipsum..." }
  guide       { User.make }
  price       { 100 }
  address     { "Estrada do Joá próximo ao número 450" }
end

User.blueprint do
  first_name  { "Nícolas" }
  last_name   { "Iensen" }
  email       { "nicolas#{sn}@paradacarioca.org.br" }
end

Event.blueprint do
  date        { Time.now }
  activity
end
