class ResourcesController < ApplicationController
  # rails g scaffold Resource title:string raw_url:string clean_url:string
  # this makes a lot of other stuff too, see commit

  before_filter :authorize, only: [:new, :create, :edit, :update]
  
  # GET /resources
  # GET /resources.json
  def index
    @resources = Resource.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @resources }
    end
  end

  # GET /resources/1
  # GET /resources/1.json
  def show
    @resource = Resource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @resource }
    end
  end

  # GET /resources/new
  # GET /resources/new.json
  def new
    @resource = Resource.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @resource }
    end
  end

  # GET /resources/1/edit
  def edit
    @resource = Resource.find(params[:id])
  end

  # POST /resources
  # POST /resources.json
  def create
    p 'running ResourcesController#create'
    @resource = Resource.new(params[:resource])

    # try to scrape
    resource_object = Resource.scrape_data(@resource.raw_url)

    # if scraping worked
    # if resource_object[:good_url]
      # add scraped data or nils to @resource
    @resource.keywords_scraped = resource_object[:keywords_scraped] ? resource_object[:keywords_scraped] : nil
    @resource.description_scraped = resource_object[:description_scraped] ? resource_object[:description_scraped] : nil
    @resource.title_scraped = resource_object[:title_scraped] ? resource_object[:title_scraped] : nil
    @resource.raw_html = resource_object[:raw_html] ? resource_object[:raw_html] : nil
    # end

    respond_to do |format|
      if @resource.save
        format.html { redirect_to @resource, notice: 'Resource was successfully created.' }
        format.json { render json: @resource, status: :created, location: @resource }
      else
        format.html { render action: "new" }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /resources/1
  # PUT /resources/1.json
  def update
    @resource = Resource.find(params[:id])

    respond_to do |format|
      if @resource.update_attributes(params[:resource])
        format.html { redirect_to @resource, notice: 'Resource was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy

    respond_to do |format|
      format.html { redirect_to resources_url }
      format.json { head :no_content }
    end
  end
end
