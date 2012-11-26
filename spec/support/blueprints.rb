# coding: utf-8
require 'machinist/active_record'

Activity.blueprint do
  name          { "Pular da Pedra da Gávea de asa-delta" }
  description   { "Lorem ipsum..." }
  guide         { User.make! }
  price         { 100 }
  address       { "Estrada do Joá próximo ao número 450" }
  image         { File.open(File.dirname(__FILE__) + "/../../features/support/activity.jpg") }
  neighborhood  { Neighborhood.first }
end

User.blueprint do
  first_name  { "Nícolas" }
  last_name   { "Iensen" }
  email       { "nicolas#{sn}@paradacarioca.org.br" }
  avatar      { "http://profile.ak.fbcdn.net/hprofile-ak-ash4/369546_536687842_1175911917_q.jpg" }
end

Event.blueprint do
  date      { Time.now }
  activity  { Activity.make! }
end
