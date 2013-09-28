# seed Brasil!

states = <<STATES
AC,Acre
AL,Alagoas
AP,Amapá
AM,Amazonas
BA,Bahia
CE,Ceará
ES,Espírito Santo
GO,Goiás
MA,Maranhão
MT,Mato Grosso
MS,Mato Grosso do Sul
MG,Minas Gerais
PA,Pará
PB,Paraíba
PR,Paraná
PE,Pernambuco
PI,Piauí
RJ,Rio de Janeiro
RN,Rio Grande do Norte
RS,Rio Grande do Sul
RO,Rondônia
RR,Roraima
SC,Santa Catarina
SP,São Paulo
SE,Sergipe
TO,Tocantins
DF,Distrito Federal
STATES

Spree::State.transaction do
  country = Spree::Country.where(iso_name: 'BRAZIL').first
  country.name = 'Brasil'
  country.save
  states.split("\n").each do |state|
    values = state.split ','
    next if values.first.blank? or values.last.blank?
    Spree::State.create! :country_id => country.id, :abbr => values[0], :name => values[1]
  end
end