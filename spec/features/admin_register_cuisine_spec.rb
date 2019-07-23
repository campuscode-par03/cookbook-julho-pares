require 'rails_helper'

feature 'admin register cuisine' do
  scenario 'create cuisine' do
    #act
    visit root_path
    click_on 'Cadastrar cozinha'
    
    fill_in 'Nome', with: 'Japonesa'
    click_on 'Salvar'

    #assert
    expect(page).to have_content 'Japonesa'
    expect(page).to have_content 'Cozinha cadastrada com sucesso'
  end

  scenario 'validate name' do
    
    visit root_path
    click_on 'Cadastrar cozinha'

    fill_in 'Nome', with: ''
    click_on 'Salvar'

    expect(page).to have_content 'Preencher todos os campos'
  end

  scenario 'validate uniqueness of name' do
    
    Cuisine.create(name: 'Sul-Africano')

    visit root_path
    click_on 'Cadastrar cozinha'

    fill_in 'Nome', with: 'Sul-Africano'
    click_on 'Salvar'

    
    expect(page).to have_content 'Ja existe cozinha com este nome'
  end


end