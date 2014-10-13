class CommentsController < ApplicationController
  include ActionController::Live

  def index
    response.headers['Content-Type'] = 'text/event-stream'
    sse = SSE.new(response.stream)
    begin
      Comment.on_change do |id|
        comment = Comment.find(id)
        t = render_to_string(partial: 'comment', formats: [:html], locals: {comment: comment})
        sse.write(t)
      end
      #   Comment.on_change do |comment|
      #   sse.write(comment)
      #   end
    rescue IOError
      # Client Disconnected
    ensure
      sse.close
    end
    render nothing: true
  end

  def new
    @comment = Comment.new
    @comments = Comment.order('created_at DESC')
  end

  def create
    if current_user
      @comment = current_user.comments.build(comment_params)
      @comment.save
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end