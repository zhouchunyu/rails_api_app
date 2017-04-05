class MicropostsController < ApplicationController
  before_action :set_micropost, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  # GET /microposts
  # GET /microposts.json
  def index
    @microposts = current_user.microposts
  end

  def search
    @q = Micropost.ransack(params[:q])
    @microposts = @q.result
    @microposts = paginate(@microposts)
    render :index
  end

  # GET /microposts/1
  # GET /microposts/1.json
  def show
  end

  # POST /microposts
  # POST /microposts.json
  def create
    @micropost = current_user.microposts.new(micropost_params)

    if @micropost.save
      render :show, status: :created, location: @micropost
    else
      render json: @micropost.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /microposts/1
  # PATCH/PUT /microposts/1.json
  def update
    if @micropost.update(micropost_params)
      render :show, status: :ok, location: @micropost
    else
      render json: @micropost.errors, status: :unprocessable_entity
    end
  end

  # DELETE /microposts/1
  # DELETE /microposts/1.json
  def destroy
    @micropost.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_micropost
      @micropost = Micropost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def micropost_params
      params.require(:micropost).permit(:content, :user_id)
    end
end
