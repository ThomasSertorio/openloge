class ContactsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    p @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to root_path
    else
      render 'loges/index'
    end

  end

  private
  def contact_params
    params.require(:contact).permit(:email, :newsletter, :address)
  end

end
