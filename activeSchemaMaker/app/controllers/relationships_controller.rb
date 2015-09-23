class RelationshipsController < ApplicationController

  #POST /relationiships
  def create
    p "*"*40
    @relationship = Relationship.new(relationship_params)
    if @relationship.save

      pk_table = Table.find(params[:relationship][:table_id])
      fk_table = Table.find(params[:relationship][:foreign_key_id])
      p "*"*40
      p pk_table
      p fk_table
      p "*"*40

      @field = fk_table.fields.new(name: "#{pk_table.name}_id", data_type: "integer")

      @field.save!
      #render canvas partial
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
