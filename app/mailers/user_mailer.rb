# encoding: utf-8

class UserMailer < ActionMailer::Base
  default from: "nao-responda@livrodaclasse.com.br"

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Recuperação de senha"
  end

  def book_invitation(inviter, user, book_uuid)
    @user = user
    @inviter = inviter
    @book_uuid = book_uuid
    mail :to => user.email, :subject => "Convite para um projeto no Livro da Classe"
  end
end
