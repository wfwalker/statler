class PlaywrightsController < ApplicationController
  # GET /playwrights
  # GET /playwrights.json
  def index
    @playwrights = Playwright.find(:all, :order => :name)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @playwrights }
    end
  end

  # GET /playwrights/1
  # GET /playwrights/1.json
  def show
    @playwright = Playwright.find(params[:id])

    @runs_by_play_id = Run.map_by_play_id(@playwright.runs)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @playwright }
    end
  end

  # GET /playwrights/new
  # GET /playwrights/new.json
  def new
    @playwright = Playwright.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @playwright }
    end
  end

  # GET /playwrights/1/edit
  def edit
    @playwright = Playwright.find(params[:id])
  end

  # POST /playwrights
  # POST /playwrights.json
  def create
    @playwright = Playwright.new(params[:playwright])

    respond_to do |format|
      if @playwright.save
        format.html { redirect_to @playwright, notice: 'Playwright was successfully created.' }
        format.json { render json: @playwright, status: :created, location: @playwright }
      else
        format.html { render action: "new" }
        format.json { render json: @playwright.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /playwrights/1
  # PUT /playwrights/1.json
  def update
    @playwright = Playwright.find(params[:id])

    respond_to do |format|
      if @playwright.update_attributes(params[:playwright])
        format.html { redirect_to @playwright, notice: 'Playwright was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @playwright.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /playwrights/1
  # DELETE /playwrights/1.json
  def destroy
    @playwright = Playwright.find(params[:id])
    @playwright.destroy

    respond_to do |format|
      format.html { redirect_to playwrights_url }
      format.json { head :no_content }
    end
  end
end
