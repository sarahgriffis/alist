class CelebritiesController < ApplicationController
  before_action :authenticate_user!, except: :edit
  before_filter :check_if_admin, :only => [:new, :create, :admin_index, :admin_update, :admin_bulk_import]

  def index
    @celebrities = Celebrity.all
  end

  def new
    @celebrity = Celebrity.new
  end

  def create
    @celebrity = Celebrity.new(celebrity_params)
    @celebrity.photo_url = @celebrity.wikipedia_url
    if @celebrity.save
      flash[:alert] = 'Created!'
      redirect_to celebrity_path(@celebrity)
    else
      flash[:alert] = 'Celebrity not saved'
      redirect_to new_celebrity_path
    end
  end

  def show
    @celebrity = Celebrity.find(params[:id])
  end

  def admin_index
    @celebrities = Celebrity.all
  end

  def admin_update
    @celebrity = Celebrity.find(params[:celebrity][:id])
    if @celebrity.update(celebrity_params)
      flash[:alert] = 'Updated!'
      redirect_to celebrities_admin_index_path
    end
  end

  def admin_bulk_import_post
    csv = File.read(params[:csv_file].path)
    csvtext = CSV.parse(csv, :headers => false)

    csvtext.each do |row|
      first_name = row[0]
      last_name = row[1]

      @celebrity = Celebrity.new()
      @celebrity.first_name = first_name
      @celebrity.last_name = last_name
      @celebrity.photo_url = @celebrity.wikipedia_url
      @celebrity.save

    end

    flash[:alert] = 'Created!'
    redirect_to celebrities_admin_index_path
  end


  def edit
    @celebrities = Celebrity.active
    #.paginate(page: params[:page], per_page: 5)
    #respond_to do |format|
    #  format.html
    #  format.js
    #end
  end

  def update
    @celebrity = Celebrity.find(params[:id])
    @celebrity_vote = CelebrityVote.find_or_initialize_by(celebrity: @celebrity, user_id: current_user.nil? ? 1 : current_user.id)

    vote_key = celebrity_params['celebrity_votes_attributes'].keys.first
    vote_value = celebrity_params['celebrity_votes_attributes'][vote_key]['vote_value']

    respond_to do |format|
      if @celebrity_vote.update(vote_value: vote_value)
        format.html { redirect_to root_path, notice: 'Vote Logged!' }
        format.json { render :json => { :error => @celebrity.errors } }
        format.js
        return

      else
        #format.html { redirect_to new_user_session_path, notice: 'Not Logged.' }
        #format.json { render json: @celebrity_vote.errors, status: :unprocessable_entity }
        format.js
        return

      end
    end
  end


  def celebrity_params
    params.require(:celebrity).permit(:id, :user_id, :first_name,:last_name, :photo_url, :active ,:celebrity_votes_attributes => [:id, :vote_value, :celebrity_id, :user_id])
  end

 #def celebrityvote_params
 #   params.require(:celebrity).permit(:celebrity_votes_attributes => [:vote_value, :celebrity_id, :user_id])
 # end
end
