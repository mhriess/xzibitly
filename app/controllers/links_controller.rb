class LinksController < ApplicationController
  def index
    @links = Link.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @links }
    end
  end

  def show
    
  end

  def delete
  end

  def new
  end

  def create
  end

  def destroy
  end
end
