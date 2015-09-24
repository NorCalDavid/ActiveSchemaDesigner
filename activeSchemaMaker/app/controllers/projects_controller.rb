class ProjectsController < ApplicationController

  before_action :set_project, only: [:show, :edit, :update, :destroy, :migration, :project_control]

  # GET /projects
  def index
    @projects = Project.all
  end

  # GET /projects/1
  def show
    @relationship = Relationship.new #this is necessary to load relationships form

    if request.xhr?
      render partial: 'canvas', status: :created, location: project_path(@project)
    else
      # @relationship = Relationship.new
      @route = "project#show"
      set_current_project(params[:id])
      @table = @project.tables.new
    end
  end

  def project_control
    @relationship = Relationship.new #this is necessary to load relationships form
    # @table = @project.tables.new
    render partial: 'project_control'
  end

  # GET /projects/new
  def new
    @project = User.find(session[:user_id]).projects.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  def create

    if request.xhr?

      @table = Project.find(session[:current_project_id]).tables.new(table_params)
      respond_to do |format|
        if @table.save
          format.json {render json: '/tables/show', table: @table, status: :created, location: @table}
        else
          format.json {render json: @table.errors, status: :unprocessable_entity}
        end
      end

    else

      @project = User.find(session[:user_id]).projects.new(project_params)

      if @project.save
        redirect_to @project, notice: 'Project was successfully created.'
      else
        render :new
      end

    end
  end

  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end

  # GET /projects/1/migration
  def migration

    headers['Content-Disposition'] = "attachment; filename=\"TODO_timestamp_#{@project.name}.rb\""
    headers['Content-Type'] ||= 'text/ruby'

    render 'migration', :layout => false
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    def set_current_project(project_id)
      session[:current_project_id] = project_id
    end

    # Only allow a trusted parameter "white list" through.
    def project_params
      params.require(:project).permit(:name, :comments)
    end

    def table_params
      params.require(:table).permit(:name, :comments, fields_attributes: [:name, :data_type, :default_value, :auto_increment, :allow_null])
    end

end
