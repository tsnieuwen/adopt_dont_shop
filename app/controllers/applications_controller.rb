class ApplicationsController < ApplicationController

  def show
    @application = Application.find(params[:id])
    @pets = @application.pets
    if (params[:pet_name])
      @searched_pet = Pet.find_by_name(params[:pet_name])
    end
  end

  def new
    @application = Application.new
  end

  def create
    @application = Application.new(application_params)
      if @application.save
        redirect_to "/applications/#{@application.id}"
      else
        flash.now[:error] = 'Application not created: Please fill in blank fields'
        render :new
      end
  end

  def update
  application = Application.find(params[:id])
  application.update({
    description: params[:description],
    application_status: "Pending"
    })
  application.save
  redirect_to "/applications/#{application.id}"
end

  private
  def application_params
    params.permit(:name, :address, :city, :state, :zip, :description)
  end

end
