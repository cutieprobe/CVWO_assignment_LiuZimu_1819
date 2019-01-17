class TagsController < ApplicationController
  def index
    @tags = [];
    @tags_all = ActsAsTaggableOn::Tag.all
    @tags_all.each do |tag|
	@tags << tag if current_user.tasks.tagged_with(tag.name) != []
    end
  end

  def show
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
    @tasks = current_user.tasks.tagged_with(@tag.name)
  end
end
