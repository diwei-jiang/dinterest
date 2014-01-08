class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @feed_items = current_user.feed.paginate(page: params[:page],
                                                per_page: 15)
    end
  end

  def recommend
    if signed_in?
      @feed_items = current_user.recommend
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
