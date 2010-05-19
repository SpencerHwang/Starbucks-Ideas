class CommentsController < ApplicationController

  def show
    puts 'hello' 
  end

  def create
    @idea = Idea.find(params[:idea_id])
    @c = @idea.comments.build(params[:comment]);
    @c.user_id = current_user.id
    @c.save

    respond_to do |format|
      format.html { redirect_to @idea }
      format.js 
    end

#    if c.save
#      redirect_to @idea, :notice => 'new comment added'
#    else
#      redirect_to @idea, :notice => "error: #{c.errors.inspect}"
#    end
  end
 
  def destroy
    @idea = Idea.find(params[:idea_id])
    @c = Comment.find(params[:id])
    @c.destroy

    respond_to do |format|
      format.html { redirect_to @idea }
      format.js 
    end
  end

end
