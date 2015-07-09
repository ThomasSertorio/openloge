class ContactsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @contact = Contact.new(contact_params)
    @contact.save
    authorize @contact
    redirect_to root_path
  end

  private
  def contact_params
    params.require(:contact).permit(:email, :newsletter, :address)
  end

end
