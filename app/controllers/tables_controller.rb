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
    @table = Project.find(session[:current_project_id]).tables.new({name: 'id', data_type: 'Integer'})
  end

  # GET /tables/1/edit
  def edit
    @table = Table.find(params[:id])
    if request.xhr?
      render partial: 'edit_modal', table: @table, status: :ok, location: @table
    else
      render json: {errors: @table.errors.full_messages}, status: :bad_request
    end
  end

  # POST /tables
  def create
    @project = Project.find(session[:current_project_id])
    @table = @project.tables.new(table_params)
    if @table.save
      add_id!(@table)
      render_table
    else
      p @table.errors.full_messages
      render :new
    end
  end

  # PATCH/PUT /tables/1
  def update
    p @table
    p "ZZZZZZZZZZZZZZZZZZZZ"
    p params
    # p table_params
    if @table.update(params)
      render_table
    else
      if request.xhr?
        render json: {errors: @table.errors.full_messages}, status: :bad_request
      else
        render :edit
      end
    end
  end

  # DELETE /tables/1
  def destroy
    @table.destroy
    @project = Project.find(session[:current_project_id])
    p_id=@project.id
    current_route = "/projects/#{p_id}"
    redirect_to current_route, notice: 'Table was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_table
      @table = Table.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def table_params
      params.require(:table).permit(
        :table,
        :id,
        :name,
        :comments,
        :position_x,
        :position_y,
        fields_attributes: [
          :name,
          :data_type,
          :default_value,
          :auto_increment,
          :allow_null,
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
          :id
        ]
      )
    end
 # "table"=>{"name"=>"samanthas", "comments"=>"", "fields_attributes"=>{"0"=>{"name"=>"king", "data_type"=>"String", "default_value"=>"", "validate_on"=>"Create", "acceptance"=>"True", "format"=>"True", "format_type"=>"Valid-Email", "presence"=>"True", "uniqueness"=>"True", "case_sensitive"=>"True", "confirmation"=>"True", "auto_increment"=>"True", "allow_null"=>"True", "length"=>"True", "length_min"=>"", "length_max"=>"", "length_is"=>"", "id"=>"587"}, "1"=>{"name"=>"id", "data_type"=>"Integer", "default_value"=>"", "validate_on"=>"Create", "acceptance"=>"True", "format"=>"True", "format_type"=>"Valid-Email", "presence"=>"True", "uniqueness"=>"True", "case_sensitive"=>"True", "confirmation"=>"True", "auto_increment"=>"True", "allow_null"=>"True", "length"=>"True", "length_min"=>"", "length_max"=>"", "length_is"=>"", "id"=>"588"}, "2"=>{"name"=>"sanata_hates", "data_type"=>"String", "default_value"=>"", "validate_on"=>"Create", "acceptance"=>"True", "format"=>"True", "format_type"=>"Valid-Email", "presence"=>"True", "uniqueness"=>"True", "case_sensitive"=>"True", "confirmation"=>"True", "auto_increment"=>"True", "allow_null"=>"True", "length"=>"True", "length_min"=>"", "length_max"=>"", "length_is"=>"", "id"=>"589"}}}, "commit"=>"Update Table", "controller"=>"tables", "action"=>"update", "id"=>"61"}
    def render_table
      render partial: 'show', layout: false, locals:{ table: @table }
    end

    def add_id!(table)
      if table.fields.nil? || !table.fields.include?("id")
        table.fields.create({name: "id", data_type: 'Integer'})
      end
      table.save!
    end

end
