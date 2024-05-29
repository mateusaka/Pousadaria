require 'rails_helper'

describe 'Dono de pousada registra uma nova promoção' do
  it 'a partir da tela inicial' do
    inn_owner = InnOwner.create!(first_name: 'Joao', last_name: 'Almeida',
                                  document: '53783222001', email: 'joao@email.com', password: '123456')
    inn = inn_owner.create_inn!(name: 'Pousada do Almeidinha', registration_number: '30638898000199', description: 'Um bom lugar',
                          address_attributes: { address: 'Rua X', number: '100', city: 'Manaus', state: 'AM', postal_code: '69067-080', neighborhood: 'Centro'})
    inn.inn_rooms.create!(name: 'Quarto com Varanda', size: 35, guest_limit: 3)
    inn.inn_rooms.create!(name: 'Quarto Térreo', size: 30, guest_limit: 3)
    login_as inn_owner, scope: :inn_owner

    visit root_path
    click_on 'Gestão de Pousadas'
    click_on 'Área de promoções'
    click_on 'Adicionar nova promoção'

    expect(page).to have_content 'Nome da promoção'
    expect(page).to have_content 'Data inicial'
    expect(page).to have_content 'Data final'
    expect(page).to have_content 'Selecione o quarto'
    expect(page).to have_content 'Informe a porcetagem de desconto'
  end

  it 'com sucesso' do
    inn_owner = InnOwner.create!(first_name: 'Joao', last_name: 'Almeida',
                                  document: '53783222001', email: 'joao@email.com', password: '123456')
    inn = inn_owner.create_inn!(name: 'Pousada do Almeidinha', registration_number: '30638898000199', description: 'Um bom lugar',
                          address_attributes: { address: 'Rua X', number: '100', city: 'Manaus', state: 'AM', postal_code: '69067-080', neighborhood: 'Centro'})
    inn.inn_rooms.create!(name: 'Quarto com Varanda', size: 35, guest_limit: 3)
    inn.inn_rooms.create!(name: 'Quarto Térreo', size: 30, guest_limit: 3)
    login_as inn_owner, scope: :inn_owner

    visit root_path
    click_on 'Gestão de Pousadas'
    click_on 'Área de promoções'
    click_on 'Adicionar nova promoção'
    fill_in 'Nome da promoção', with: 'Promo1'
    fill_in 'Data inicial', with: Date.today
    fill_in 'Data final', with: 1.day.from_now
    select 'Quarto com Varanda', from: 'Selecione o quarto'
    fill_in 'Informe a porcetagem de desconto', with: 30
    click_on 'Salvar'

    expect(page).to have_content 'Cadastro com sucesso'
    expect(page).to have_content 'Promo1'
  end
end
