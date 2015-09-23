class RelationshipsController < ApplicationController

  #POST /relationiships
  def create
    p "*"*40
    p params



    p "*"*40
    @relationship = Relationship.new(relationship_params)
    if @relationship.save

      pk_table = Table.find(params[:table_id])
      fk_table = Table.find(params[:foreign_key_id])
      @field = fk_table.fields.new(name: "#{pk_table.name}_id", data_type: "integer")
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
