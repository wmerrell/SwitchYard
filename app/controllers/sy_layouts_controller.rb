# SyLayoutsController
class SyLayoutsController < ApplicationController
  before_action :set_sy_layout, only: [:show, :edit, :update, :destroy]

  # GET /layouts
  # GET /layouts.json
  def index
    authorize
    @title = @heading = 'SwitchYard - Your Layouts'
    @sy_layouts = SyLayout.all
  end

  # GET /layouts/1
  # GET /layouts/1.json
  def show
    authorize
    @title = @heading = 'SwitchYard'
    @intro = 'Welcome to SwitchYard'
    @content = 'Welcome to SwitchYard'
  end

  # GET /layouts/new
  def new
    authorize
    @title = @heading = 'SwitchYard'
    @intro = 'Welcome to SwitchYard'
    @content = 'Welcome to SwitchYard'
    @sy_layout = SyLayout.new
  end

  # GET /layouts/1/edit
  def edit
    authorize
    @title = @heading = 'SwitchYard'
    @intro = 'Welcome to SwitchYard'
    @content = 'Welcome to SwitchYard'
  end

  # POST /layouts
  # POST /layouts.json
  def create
    authorize
    @title = @heading = 'SwitchYard'
    @intro = 'Welcome to SwitchYard'
    @content = 'Welcome to SwitchYard'
    @sy_layout = SyLayout.new(sy_layout_params)
    @sy_layout.created_by = @sy_layout.updated_by = current_user

    respond_to do |format|
      if @sy_layout.save
        format.html { redirect_to @sy_layout, notice: 'Layout was successfully created.' }
        format.json { render :show, status: :created, location: @sy_layout }
      else
        format.html { render :new }
        format.json { render json: @sy_layout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /layouts/1
  # PATCH/PUT /layouts/1.json
  def update
    authorize
    @title = @heading = 'SwitchYard'
    @intro = 'Welcome to SwitchYard'
    @content = 'Welcome to SwitchYard'

    respond_to do |format|
      if @sy_layout.update(sy_layout_params.merge(updated_by: current_user))
        format.html { redirect_to @sy_layout, notice: 'Layout was successfully updated.' }
        format.json { render :show, status: :ok, location: @sy_layout }
      else
        format.html { render :edit }
        format.json { render json: @sy_layout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /layouts/1
  # DELETE /layouts/1.json
  def destroy
    authorize
    @sy_layout.destroy
    respond_to do |format|
      format.html { redirect_to sy_layouts_url, notice: 'Layout was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_sy_layout
    @sy_layout = SyLayout.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def sy_layout_params
    params.require(:sy_layout).permit(:name, :owner, :description)
  end
end
