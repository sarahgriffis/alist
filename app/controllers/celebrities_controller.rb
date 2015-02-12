class CelebritiesController < ApplicationController
  before_action :authenticate_user!, except: :edit

  def index
    @celebrities = Celebrity.all
  end

  def show
    @celebrity = Celebrity.find(:id)
  end

  def edit
    @celebrities = Celebrity.all.paginate(page: params[:page], per_page: 5)
  end

  def update
    @celebrity = Celebrity.find(params[:id])

    #@celebrity_vote = CelebrityVote.find_or_initialize_by


    @celebrity.update(celebrity_params)

    redirect_to root_path
    #@celebrity_vote = CelebrityVote.new()
    #@celebrity_vote.update(celebrityvote_params)
    #redirect_to root_path
  end

  private

  def celebrity_params
    params.require(:celebrity).permit(:id, :user_id, :first_name,:celebrity_votes_attributes => [:id, :vote_value, :celebrity_id, :user_id])
  end

 #def celebrityvote_params
 #   params.require(:celebrity).permit(:celebrity_votes_attributes => [:vote_value, :celebrity_id, :user_id])
 # end
end
