class WelcomesController < ApplicationController
  #before_action :set_welcome, only: %i[ show edit update destroy ]

  # GET /welcomes
  def index
    @welcomes = Welcome.all
  end

  # GET /welcomes/1
  def show
  end

  # GET /welcomes/new
  def new
    @welcome = Welcome.new
  end

  # GET /welcomes/1/edit
  def edit
  end

  # POST /welcomes
  def create
    @welcome = Welcome.new(welcome_params)

    if @welcome.save
      redirect_to @welcome, notice: "Welcome was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /welcomes/1
  def update
    if @welcome.update(welcome_params)
      redirect_to @welcome, notice: "Welcome was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /welcomes/1
  def destroy
    @welcome.destroy
    redirect_to welcomes_url, notice: "Welcome was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_welcome
      @welcome = Welcome.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def welcome_params
      params.fetch(:welcome, {})
    end
end
