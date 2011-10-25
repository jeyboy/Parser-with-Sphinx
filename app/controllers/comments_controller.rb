class CommentsController < ApplicationController
  def create
    comment = Comment.new(params[:comment_attr])
    if comment.save
      render :json => {:state => true, :content => render_to_string(:partial =>'comments/show', :locals => {:comment => comment})}
    else
      render :json => {:state => false}
    end
  end
end
