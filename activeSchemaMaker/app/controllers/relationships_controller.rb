class RelationshipsController < ApplicationController

  #POST /relationiships
  def create
    @relationship = Relationship.new(relationship_params)

    if @relationship.save
      table_names = get_table_names(Project.find(session[:current_project_id]).tables)
      options_array = select_menu_table_names(table_names)

      #you need to iterate through the options array to get the option value and relate it to the name of the table so that you can create the foriegn key name "_id"

      if @field.save
        format.json {render json: '/fields/show', field: @field, status: :created, location: @field}
      end
      render json: @relationship, location: @relationship
    else
      render json: @relationship.errors, status: :unprocessable_entity
    end
  end

  # def destroy
  # end

  # private

  # def make_connection
  # end

  private

  def relationship_params
    params.require(:relationship).permit(:table_id, :foreign_key_id, :relationship_type)
  end

  # def table_params
  #   params.require(:table).permit(:name, :comments, fields_attributes: [:name, :data_type, :default_value, :auto_increment, :allow_null])
  # end

end
