class LocationsController < ApplicationController
  include VotingController
  before_action :authenticate_user!
  before_action :set_location, only: [:edit, :update, :destroy]

  def index
    @locations = current_user.locations.paginate(page: params[:page], per_page: 5)
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = current_user.locations.build
  end

  def edit
    authorize @location
  end

  def create
    @location = current_user.locations.build(location_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to user_locations_url(current_user), notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_location
      @location = current_user.locations.find(params[:id])
    end

    def location_params
      params.require(:location).permit(
        :name,
        :lat,
        :lng,
        :country,
        :state,
        :city,
        :zipcode,
        :address_line_1,
        :address_line_2,
        :user_id,
        images: []
      )
    end
end
