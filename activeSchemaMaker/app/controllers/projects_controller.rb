class ProjectsController < ApplicationController

  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  def index
    @projects = Project.all
  end

  # GET /projects/1
  def show
    @relationship = Relationship.new
    @route = "project#show"
    set_current_project(params[:id])

    if Project.find(params[:id]).tables.count > 0
      @tables = Project.find(params[:id]).tables
    else
      @tables = ["No Tables"]
    end

    @table = @project.tables.new

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
    @project = User.find(session[:user_id]).projects.new(project_params)

    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new
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

  #POST /relationiships
  def create_relationships
    @relationship = Relationship.new(relationship_params)
    if @relationship.save
      render json: @relationship, location: @relationship
    else
      render json: @relationship.errors, status: :unprocessable_entity
    end
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

    def relationship_params
      params.require(:relationship).permit(:table_id, :foreign_key_id, :relationship_type)
    end

end
