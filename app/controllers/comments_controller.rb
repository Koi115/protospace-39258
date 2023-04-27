class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to "/prototypes/#{@comment.prototype.id}"  # コメントと結びつくプロトタイプ詳細画面に遷移する
    else
      @prototype = Prototype.find(params[:prototype_id])
      @comments = Comment.where(prototype_id: params[:prototype_id])
      render "prototypes/show"
    end
  end




  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end



end
