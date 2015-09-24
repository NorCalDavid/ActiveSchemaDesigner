class TablesController < ApplicationController
  before_action :set_table, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js
  layout proc{|c| c.request.xhr? ? false : "application" }

  # GET /tables
  def index
    @tables = Table.all
  end

  # GET /tables/1
  def show
  end

  # GET /tables/new
  def new
    @table = Project.find(session[:current_project_id]).tables.new
  end

  # GET /tables/1/edit
  def edit
    @table = Table.find(params[:id])
    if request.xhr?
      render partial: 'projects/edit_tables', table: @table, status: :ok, location: @table
    end

  end

  # POST /tables
  def create
    @project = Project.find(session[:current_project_id])
    @table = @project.tables.new(table_params)
    if @table.save
      render_table
    else
      render :new
    end
  end

  # PATCH/PUT /tables/1
  def update
    if @table.update(table_params)
      render_table
    else
      render :edit
    end
  end

  # DELETE /tables/1
  def destroy
    @table.destroy
    redirect_to tables_url, notice: 'Table was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_table
      @table = Table.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def table_params
      params.require(:table).permit(:name, :comments, fields_attributes: [:name, :data_type, :default_value, :auto_increment, :allow_null])
    end

    def render_table
      render partial: 'show', layout: false, locals:{ table: @table }
    end
end
