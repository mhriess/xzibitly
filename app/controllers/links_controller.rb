  class LinksController < ApplicationController
  def index
    @links = Link.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @links }
    end
  end

  def show
    @link = Link.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

  def delete
  end

  def new
    @link = Link.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @link }
    end
  end

  def create
    if current_user
      @user = User.find(current_user.id)
      @link = @user.links.build(params[:link])
    else
      @link = Link.new(params[:link])
    end

    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: 'Article was successfully created.' }
        format.json { render json: @link, status: :created, location: @link }
      else
        format.html { render action: "new" }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy

    respond_to do |format|
      format.html { redirect_to links_url }
      format.json { head :no_content }
    end
  end

  def go
    if @link = Link.find_by_shortened_link(params[:shortened_link])
      value = @link.counter += 1
      @link.update_attribute(:counter, value)
      redirect_to @link.url
    else
      redirect_to links_path
    end
  end
end
