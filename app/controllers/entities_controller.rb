class EntitiesController < ApplicationController
  def index
    @group = Group.find_by_id(params[:group_id])
    @entities = []
    @total_amount = 0
    @group.group_entities.order(created_at: :desc).each do |group_entity|
      @entities.push(group_entity.entity)
      @total_amount += group_entity.entity.amount
    end
  end

  def new
    @entity = Entity.new
  end

  def create
    @entity = current_user.entities.new(entity_params)

    respond_to do |format|
      if @entity.save
        GroupEntity.create(group_id: params[:group_id], entity_id: @entity.id)
        format.html { redirect_to group_entities_path, notice: 'Transaction was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def entity_params
    params.require(:entity).permit(:name, :amount).merge!(author_id: current_user.id)
  end
end
