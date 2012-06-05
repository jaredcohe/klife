class CollectionsController < ApplicationController
  before_filter :authorize, only: [:new, :create, :edit, :update]

  # GET /collections
  # GET /collections.json
  def index
    @collections = Collection.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @collections }
    end
  end

  # GET /collections/1
  # GET /collections/1.json
  def show
    @collection = Collection.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @collection }
    end
  end

  # GET /collections/new
  # GET /collections/new.json
  def new
    @collection = Collection.new
    @collection.collectionizes.build.build_resource
    
    #2.times { @collection.collectionizes.build.build_resource }
    p @collection
    p @collection.collectionizes
    p @collection.resources
    p @collection.collectionizes.first.resource
    p @collection.collectionizes.last.resource

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @collection }
    end
  end

  # GET /collections/1/edit
  def edit
    @collection = Collection.find(params[:id])
  end

  # POST /collections
  # POST /collections.json
  def create
    @collection = Collection.new(params[:collection])

    # scrape each resource URL to add those fields
    @collection.collectionizes.each do |each_collectionize|
      resource_object = Resource.scrape_data(each_collectionize.resource.raw_url)

      each_collectionize.resource
      resource_object = Resource.scrape_data(@resource.raw_url)
      each_collectionize.resource.keywords_scraped = resource_object[:keywords_scraped] ? resource_object[:keywords_scraped] : nil
      each_collectionize.resource.description_scraped = resource_object[:description_scraped] ? resource_object[:description_scraped] : nil
      each_collectionize.resource.title_scraped = resource_object[:title_scraped] ? resource_object[:title_scraped] : nil
      each_collectionize.resource.raw_html = resource_object[:raw_html] ? resource_object[:raw_html] : nil
    end

    respond_to do |format|
      if @collection.save
        format.html { redirect_to @collection, notice: 'Collection was successfully created.' }
        format.json { render json: @collection, status: :created, location: @collection }
      else
        format.html { render action: "new" }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /collections/1
  # PUT /collections/1.json
  def update
    @collection = Collection.find(params[:id])

    respond_to do |format|
      if @collection.update_attributes(params[:collection])
        format.html { redirect_to @collection, notice: 'Collection was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collections/1
  # DELETE /collections/1.json
  def destroy
    @collection = Collection.find(params[:id])
    @collection.destroy

    respond_to do |format|
      format.html { redirect_to collections_url }
      format.json { head :no_content }
    end
  end
end
