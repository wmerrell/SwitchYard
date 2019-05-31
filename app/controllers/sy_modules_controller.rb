# SyModulesController
class SyModulesController < ApplicationController
  before_action :set_sy_module, only: [:show, :edit, :update, :destroy]

  # GET /modules
  # GET /modules.json
  def index
    authorize
    @title = @heading = 'SwitchYard - Your Modules'
    @sy_modules = SyModule.all
  end

  # GET /modules/1
  # GET /modules/1.json
  def show
    authorize
    @title = @heading = 'SwitchYard'
    @intro = 'Welcome to SwitchYard'
    @content = 'Welcome to SwitchYard'
  end

  # GET /modules/new
  def new
    authorize
    @title = @heading = 'SwitchYard'
    @intro = 'Welcome to SwitchYard'
    @content = 'Welcome to SwitchYard'
    @sy_module = SyModule.new
  end

  # GET /modules/1/edit
  def edit
    authorize
    @title = @heading = 'SwitchYard'
    @intro = 'Welcome to SwitchYard'
    @content = 'Welcome to SwitchYard'
  end

  # POST /modules
  # POST /modules.json
  def create
    authorize
    @title = @heading = 'SwitchYard'
    @intro = 'Welcome to SwitchYard'
    @content = 'Welcome to SwitchYard'
    @sy_module = SyModule.new(sy_module_params)
    @sy_module.created_by = @sy_module.updated_by = current_user

    respond_to do |format|
      if @sy_module.save
        format.html { redirect_to @sy_module, notice: 'Module was successfully created.' }
        format.json { render :show, status: :created, location: @sy_module }
      else
        format.html { render :new }
        format.json { render json: @sy_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /modules/1
  # PATCH/PUT /modules/1.json
  def update
    authorize
    @title = @heading = 'SwitchYard'
    @intro = 'Welcome to SwitchYard'
    @content = 'Welcome to SwitchYard'

    respond_to do |format|
      if @sy_module.update(sy_module_params.merge(updated_by: current_user))
        format.html { redirect_to @sy_module, notice: 'Module was successfully updated.' }
        format.json { render :show, status: :ok, location: @sy_module }
      else
        format.html { render :edit }
        format.json { render json: @sy_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /modules/1
  # DELETE /modules/1.json
  def destroy
    authorize
    @sy_module.destroy
    respond_to do |format|
      format.html { redirect_to sy_modules_url, notice: 'Module was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_sy_module
    @sy_module = SyModule.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def sy_module_params
    params.require(:sy_module).permit(:name, :owner, :module_type, :width, :length, :description)
  end
end
