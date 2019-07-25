require 'rails_helper'

feature 'User Sign in' do
  scenario 'Successfully' do
    user = User.create(email: 'fulano@gmail.com', password: '123321')

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: '123321'
    click_on 'Logar'

    expect(current_path).to eq root_path
    expect(page).to have_link 'Sair'
    expect(page).to_not have_link 'Entrar'
  end

  scenario 'and sign out' do
    user = User.create(email: 'fulano@gmail.com', password: '123321')

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: '123321'
    click_on 'Logar'
    click_on 'Sair'

    expect(current_path).to eq root_path
    expect(page).to_not have_link 'Sair'
    expect(page).to have_link 'Entrar'
  end
end