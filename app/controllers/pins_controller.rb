class PinsController < ApplicationController
  before_action :signed_in_user, only: [:new, :create, :destroy]
  before_action :correct_user,   only: :destroy

  def new
    @pin = current_user.pins.new

    # repin
    if !params[:pin_id].nil? && !params[:repin_id].nil?
      repin_id = params[:repin_id].to_i
      pin_id = params[:pin_id].to_i
      if repin_id == 0
        @pin.repin_id = pin_id
      elsif repin_id > 0
        @pin.repin_id = repin_id
      end
      @pin.url = Pin.find(@pin.repin_id).url
    end

    @boards = current_user.boards
  end

  def show
    @pin = Pin.find(params[:id])
  end

  def create
    @pin = current_user.pins.new

    if pin_params[:url].empty?
      image_file = pin_params[:image_file]
      @pin.s3_filename = "#{image_file.original_filename.downcase}.#{Time.now.to_i.to_s}"
      obj = $Bucket.objects.create(@pin.s3_filename, :file => image_file)
      obj.acl = :public_read
      @pin.url = obj.public_url.to_s
    else
      @pin.url = pin_params[:url]
    end

    @pin.repin_id = pin_params[:repin_id].to_i if !pin_params[:repin_id].nil?

    @pin.board_id = Board.find_by(name: pin_params[:board]).id unless pin_params[:board].nil?
    @pin.description = pin_params[:description]

    # tag++
    @pin.tag_list = pin_params[:tag_list]

    if @pin.save
      flash[:success] = "New pin created"
      redirect_to @pin
    else
      @boards = current_user.boards
      render action: 'new'
    end
  end

  def destroy
    board_id = @pin.board.id
    unless @pin.s3_filename.nil?
      $Bucket.objects[@pin.s3_filename].delete
    end
    @pin.destroy
    flash[:success] = "Successful deleted."
    redirect_to board_path(board_id)
  end

  def like
    current_user.liked_pins.push Pin.find(params[:pin_id])
    render :text => { like: true }.to_json
  end

  def unlike
    current_user.liked_pins.delete Pin.find(params[:pin_id])
    render :text => { like: false }.to_json
  end

  private
    def pin_params
      params.require(:pin).permit(:url, :image_file, 
                                :board, :description, 
                                :repin_id, :tag_list)
    end

    def correct_user
      @pin = current_user.pins.find_by(id: params[:id])
      redirect_to root_url if @pin.nil?
    end
end