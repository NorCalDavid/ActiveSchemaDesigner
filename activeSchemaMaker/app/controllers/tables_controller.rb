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
    @table = Table.new
  end

  # GET /tables/1/edit
  def edit
  end

  # POST /tables
  def create
    @table = Table.new(table_params)
    @table.project_id = session[:current_project_id]

    if request.xhr?
      respond_to do |format|
      if @table.save
        format.html {redirect_to @table, notice: 'Table was successfully created.'}
        format.json {respond_with json: @table, status: :created, location: @table}
      else
        format.html {render :new}
        format.json {render json: @table.errors, status: :unprocessable_entity}
      end
    end
  end
end

  # PATCH/PUT /tables/1
  def update
    if @table.update(table_params)
      redirect_to @table, notice: 'Table was successfully updated.'
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
end
