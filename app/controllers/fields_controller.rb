class FieldsController < ApplicationController

  before_action :set_field, only: [:show, :edit, :update, :destroy]

  # GET /fields
  def index
    @fields = Field.all
  end

  # GET /fields/1
  def show
  end

  # GET /fields/new
  # def new
  #   @field = Field.new
  # end

  # GET /tables/:table_id/fields/new
  def  new
    @table = Table.find(params[:table_id])
    @table.fields << Field.create(name: "new field")
    #below not working correctly
    if request.xhr?
      render partial: '/tables/_edit_modal', table: @table, status: :ok, location: @table 
    end
    # @project = Project.find(session[:current_project_id])
    # p_id=@project.id
    # current_route = "/projects/#{p_id}"
    # redirect_to current_route, notice: 'Table was successfully destroyed.'
  end

  # GET /fields/1/edit
  def edit
  end

  # POST /fields
  def create

    @field = Field.new(field_params)

    if @field.save
      redirect_to @field, notice: 'Field was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /fields/1
  def update
    if @field.update(field_params)
      @project = Project.find(session[:current_project_id])
      p_id=@project.id
      current_route = "/projects/#{p_id}"
      redirect_to current_route
    else
      render :edit
    end
  end

  # DELETE /fields/1
  def destroy
    @field.destroy
    # stop-gap-redirect code below - should be handled with js
    @project = Project.find(session[:current_project_id])
    p_id=@project.id
    current_route = "/projects/#{p_id}"
    redirect_to current_route, notice: 'Field was successfully destroyed.'
    # redirect_to fields_url, notice: 'Field was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_field
      @field = Field.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def field_params
      params.permit(:id, :name, :data_type, :default_value, :auto_increment, :allow_null, :table_id, 
          :validate_on,
          :acceptance,
          :format,
          :format_type,
          :presence,
          :uniqueness,
          :case_sensitive,
          :confirmation,
          :length,
          :length_min,
          :length_max,
          :length_is,
          )
    end

end
