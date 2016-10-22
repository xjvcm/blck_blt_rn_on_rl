class IdeasController < ApplicationController
  def index
    @user = current_user
    @ideas = Idea.all
  end
  def create
    idea = Idea.new(content: idea_params['content'], user: current_user)
    flash["success"] = "Idea added!" if idea.save
    redirect_to "/ideas/"
  end
  def show
    @idea = Idea.find(params[:id])
  end
  def destroy
    idea = Idea.find(params[:id])
    idea.destroy if idea.user == current_user
    redirect_to "/ideas/"
  end
  private
    def idea_params
      params.require(:idea).permit(:content)
    end
end
