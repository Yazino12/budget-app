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

    if @group.save
      redirect_to groups_path, flash: { success: 'Category was successfully created.' }
    else
      redirect_to new_group_path, flash: { error: @group.errors.full_messages }
    end
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
