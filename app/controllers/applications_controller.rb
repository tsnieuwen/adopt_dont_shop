class ApplicationsController < ApplicationController

  def show
    @application = Application.find(params[:id])
    @pets = @application.pets
  end

  def new

  end

  def create
    application = Application.new({
      name: params[:name],
      address: params[:address],
      city: params[:city],
      state: params[:state],
      zip: params[:zip],
      description: params[:description]
      })
      application.save

      redirect_to "/applications/#{application.id}"
  end

end
