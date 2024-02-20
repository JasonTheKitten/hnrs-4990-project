class TopicsController < ApplicationController
  def index
    require_trailing_slash
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end
end
