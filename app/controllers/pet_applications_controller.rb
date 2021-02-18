class PetApplicationsController < ApplicationController

  def create
    @pet = Pet.find(params[:pet])
    @application = Application.find(params[:application])
    @pet_application = PetApplication.new(pet: @pet, application: @application)
    @pet_application.save
    @application = params[:application]
    redirect_to "/applications/#{@application.to_i}"
  end

  def update
    status = params[:status]
    pet_application = PetApplication.find_by(pet_id: params[:pet].to_i, application_id: params[:application].to_i)
    pet_application.update(status: status)
    pet_application.save
    redirect_to "/admin/applications/#{params[:application].to_i}"
  end

  # def new
  #   @application = Application.new
  # end
  #
  # def create
  #   @application = Application.new(application_params)
  #     if @application.save
  #       redirect_to "/applications/#{@application.id}"
  #     else
  #       flash.now[:error] = 'Application not created: Please fill in blank fields'
  #       render :new
  #     end
  # end
  #
  # private
  # def pet_application_params
  #   params.permit(:pet, :application)
  # end

end
