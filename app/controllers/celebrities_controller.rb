class CelebritiesController < ApplicationController
  before_action :authenticate_user!, except: [:edit, :all_full_names]
  before_filter :check_if_admin, :only => [:new, :create, :admin_index, :admin_update, :admin_bulk_import]

  require 'open-uri'

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
      download_photo
      redirect_to celebrity_path(@celebrity)
    else
      flash[:alert] = 'Celebrity not saved'
      redirect_to new_celebrity_path
    end
  end

  def download_photo
    open("app/assets/images/#{@celebrity.id}_photo.jpg", 'wb') do |file|
      file << open(@celebrity.photo_url).read
    end
  end

  def show
    @celebrity = Celebrity.find(params[:id])
  end

  def admin_index
    @celebrities = Celebrity.all.order(:id)
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
    if params[:query]
      ids = Celebrity.active.name_contains(params[:query].gsub(/\s+/, "")).map {|c| c.id}
      if ids.empty?
        @celebrities = Celebrity.active.paginate(page: params[:page], per_page: 1)
      else
        sql ="(select * from celebrities where id IN (#{ids.join(',')})) union all (select * from celebrities where id NOT IN (#{ids.join(",")}) AND id > '#{ids.min}' AND active) union all (select * from celebrities where id NOT IN (#{ids.join(",")}) AND id < '#{ids.min}' AND active)"
        @celebrities = Celebrity.paginate_by_sql(sql, :page => params[:page], :per_page => 1)
      end
    elsif params[:celeb_id]
      sql ="(select * from celebrities where id = '#{params[:celeb_id].to_i}') union all (select * from celebrities where id > '#{params[:celeb_id].to_i}' AND active) union all (select * from celebrities where id <  '#{params[:celeb_id].to_i}' AND active)"
      @celebrities = Celebrity.paginate_by_sql(sql, :page => params[:page], :per_page => 1)
    else
      @celebrities = Celebrity.active.paginate(page: params[:page], per_page: 1)
    end

    #@all_names = Celebrity.active.map {|c| ["#{c.full_name.strip}", c.id] }
    #@all_names.sort!

    # for infinite scroll
    respond_to do |format|
      format.html
      format.js
    end
  end



  def all_full_names
    render json: Celebrity.active.map {|c| c.full_name.strip}
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
