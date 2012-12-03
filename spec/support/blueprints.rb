# coding: utf-8
require 'machinist/active_record'

Activity.blueprint do
  name          { "Pular da Pedra da Gávea de asa-delta" }
  description   { "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\n\nIt has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\nLorem Ipsum is simply dummy text of the printing and typesetting industry.\n\nLorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\n\nIt has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum." }
  guide         { User.make! }
  address       { "Estrada do Joá próximo ao número 450" }
  image         { File.open(File.dirname(__FILE__) + "/../../features/support/activity.jpg") }
  neighborhood  { Neighborhood.first }
  price         { 100 }
end

User.blueprint do
  first_name  { "Nícolas" }
  last_name   { "Iensen" }
  email       { "nicolas#{sn}@paradacarioca.org.br" }
  avatar      { "http://profile.ak.fbcdn.net/hprofile-ak-ash4/369546_536687842_1175911917_q.jpg" }
end

Event.blueprint do
  date              { Time.now + 1.day }
  activity          { Activity.make! }
  duration          { 5 }
  minimum_attendees { 2 }
  maximum_attendees { 10 }
  price             { 100 }
end

Review.blueprint do
  activity  { Activity.make! }
  user      { User.make! }
  description { "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum." }
end
