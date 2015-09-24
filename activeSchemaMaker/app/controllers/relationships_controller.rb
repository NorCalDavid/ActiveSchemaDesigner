class RelationshipsController < ApplicationController

  #POST /relationiships
  def create

    pk_table = Table.find(params[:relationship][:table_id])
    fk_table = Table.find(params[:relationship][:foreign_key_id])
    @field = fk_table.fields.new(name: "#{pk_table.name}_id", data_type: "integer")
    @field.save!
    # fields = Table.find(params[:relationship][:table_id]).fields
    # primary_port = "pp#{fields[0].id}"
    # foreign_port = "fp#{@field.id}"

    # args = {  table_id: params[:relationship][:table_id],
    #           foreign_key_id: params[:relationship][:foreign_key_id],
    #           relationship_type: params[:relationship][:relationship_type],
    #           primary_port: primary_port,
    #           foreign_port: foreign_port }

    # @relationship = pk_table.relationships.new(args)
    @relationship = Relationship.new(relationship_params)
    if @relationship.save

      render json: @relationship, location: @relationship
    else
      render json: @relationship.errors, status: :unprocessable_entity
    end
  end

  private

  def relationship_params
    params.require(:relationship).permit(:table_id,
                                         :foreign_key_id,
                                         :relationship_type,
                                         :primary_port,
                                         :foreign_port)
  end

  # def table_params
  #   params.require(:table).permit(:name, :comments, fields_attributes: [:name, :data_type, :default_value, :auto_increment, :allow_null])
  # end

end
