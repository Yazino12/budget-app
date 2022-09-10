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
    @icons = %w[health sneakers food electronics cars furniture]
  end

  def create
    @group = current_user.groups.new(group_params)
    @group.icon = map_to_icon @group

    if @group.save
      redirect_to groups_path, flash: { success: 'Category was successfully created.' }
    else
      redirect_to new_group_path, flash: { error: @group.errors.full_messages }
    end
  end

  def map_to_icon(category)
    case category.icon
    when 'Health'
      'https://cdn-icons-png.flaticon.com/512/2382/2382461.png'
    when 'Sneakers'
      'https://cdn-icons-png.flaticon.com/512/2741/2741289.png'
    when 'Food'
      'https://cdn-icons-png.flaticon.com/512/2276/2276931.png'
    when 'Electronics'
      'https://cdn-icons-png.flaticon.com/512/1261/1261106.png'
    when 'Cars'
      'https://cdn-icons-png.flaticon.com/512/2330/2330453.png'
    when 'Furniture'
      'https://cdn-icons-png.flaticon.com/512/2590/2590525.png'
    else
      'https://cdn-icons-png.flaticon.com/512/7734/7734301.png'
    end
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
