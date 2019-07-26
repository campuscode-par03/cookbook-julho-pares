def login(user = User.create(email: 'fulano@gmail.com', password: '123321'))
  visit root_path
  click_on 'Entrar'
  fill_in 'Email', with: user.email
  fill_in 'Senha', with: '123321'
  click_on 'Logar'
  return user
end