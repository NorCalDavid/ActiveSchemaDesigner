class RelationshipsController < ApplicationController

  #POST /relationiships
  def create
    @relationship = Relationship.new(relationship_params)
    if @relationship.save
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


end
