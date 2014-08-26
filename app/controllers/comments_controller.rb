class CommentsController < ApplicationController
  def new
    @comments = Comment.new
  end

  def create
  end
end