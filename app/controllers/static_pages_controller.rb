class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @pin = current_user.pins.build
      @feed_items = current_user.feed.paginate(page: params[:page],
                                                per_page: 20)
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
