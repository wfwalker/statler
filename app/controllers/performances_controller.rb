class PerformancesController < ApplicationController
  # GET /performances
  # GET /performances.json
  def index
    @performances = Performance.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @performances }
    end
  end

  # GET /performances/1
  # GET /performances/1.json
  def show
    @performance = Performance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @performance }
    end
  end

  # GET /performances/new
  # GET /performances/new.json
  def new
    @performance = Performance.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @performance }
    end
  end

  # GET /performances/1/edit
  def edit
    @performance = Performance.find(params[:id])
  end

  # POST /performances
  # POST /performances.json
  def create
    @performance = Performance.new(params[:performance])

    respond_to do |format|
      if @performance.save
        format.html { redirect_to @performance, notice: 'Performance was successfully created.' }
        format.json { render json: @performance, status: :created, location: @performance }
      else
        format.html { render action: "new" }
        format.json { render json: @performance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /performances/1
  # PUT /performances/1.json
  def update
    @performance = Performance.find(params[:id])

    respond_to do |format|
      if @performance.update_attributes(params[:performance])
        format.html { redirect_to @performance, notice: 'Performance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @performance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /performances/1
  # DELETE /performances/1.json
  def destroy
    @performance = Performance.find(params[:id])
    @performance.destroy

    respond_to do |format|
      format.html { redirect_to performances_url }
      format.json { head :no_content }
    end
  end
end
