require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation' do
    it 'é valido' do
      user = User.new( full_name: 'Mario Bros',
                       email: 'mrio@gmail.com',
                       location: 'São Paulo, Brasil',
                       password: 'segredo' )

     expect(user).to be_valid
    end

    it "é invalido sem o nome completo" do
      user = User.new(full_name: nil)

      user.valid?

      expect(user.errors[:full_name]).to include("can't be blank")
    end

    it "é invalido sem o email" do
      user = User.new(email: nil)

      user.valid?

      expect(user.errors[:email]).to include("can't be blank")
    end

    it "é invalido sem a localização" do
      user = User.new(location: nil)

      user.valid?

      expect(user.errors[:location]).to include("can't be blank")
    end

    it "é invalido sem a senha" do
      user = User.new(password: nil)

      user.valid?

      expect(user.errors[:password]).to include("can't be blank")
    end

    it "é inválido caso já exista um e-mail igual" do
      user = User.create( full_name: 'Steve Martin',
                      email: 'contato@ironmaiden.com' )
      user = User.new( full_name: 'Bruce Willis',
                       email: 'contato@ironmaiden.com' )
      user.valid?
      
      expect(user.errors[:email]).not_to include('has already been taken')
     end
  end
end
