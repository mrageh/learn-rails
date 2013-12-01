class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(secure_params)
    Rails.logger.debug "DEBUG: params are #{params}"
    Rails.logger.debug "DEBUG: what is #{secure_params}"
    if @contact.valid?
      flash[:notice] = "Message sent from #{@contact.name}."
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def secure_params
    params.require(:contact).permit(:name, :email, :content)
  end
end
