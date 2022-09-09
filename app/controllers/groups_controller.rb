class GroupsController < ApplicationController
  def index
    @groups = current_user.groups.order(created_at: :desc).all
    @total_amount = []

    @groups.each do |group|
      total = 0
      group.entities.each do |entity|
        total += entity.amount
      end
      @total_amount.push(total)
    end
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to groups_path, notice: 'Category was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
