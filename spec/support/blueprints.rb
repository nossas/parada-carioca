# coding: utf-8
require 'machinist/active_record'

Activity.blueprint do
  name        { "Pular da Pedra da Gávea de asa-delta" }
  description { "Lorem ipsum..." }
  user_id     { User.make!.id }
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
  activity_id    { Activity.make!.id }
end
