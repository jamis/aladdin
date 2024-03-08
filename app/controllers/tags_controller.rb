class TagsController < ApplicationController
  before_action :find_tag, only: %i[ show edit update destroy ]

  def create
    Tag.create(tag_params)
    redirect_to tags_url
  end

  def update
    @tag.update(tag_params)
    redirect_to tags_url
  end

  def destroy
    @tag.destroy
    redirect_to tags_url
  end

  private

  def find_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
