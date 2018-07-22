class DummyranksController < ApplicationController
  before_action :set_dummyrank, only: [:show, :edit, :update, :destroy]

  # GET /dummyranks
  # GET /dummyranks.json
  def index
    @dummyranks = Dummyrank.all
  end

  # GET /dummyranks/1
  # GET /dummyranks/1.json
  def show
  end

  # GET /dummyranks/new
  def new
    @dummyrank = Dummyrank.new
  end

  # GET /dummyranks/1/edit
  def edit
  end

  # POST /dummyranks
  # POST /dummyranks.json
  def create
    @dummyrank = Dummyrank.new(dummyrank_params)

    respond_to do |format|
      if @dummyrank.save
        format.html { redirect_to @dummyrank, notice: 'Dummyrank was successfully created.' }
        format.json { render :show, status: :created, location: @dummyrank }
      else
        format.html { render :new }
        format.json { render json: @dummyrank.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dummyranks/1
  # PATCH/PUT /dummyranks/1.json
  def update
    respond_to do |format|
      if @dummyrank.update(dummyrank_params)
        format.html { redirect_to @dummyrank, notice: 'Dummyrank was successfully updated.' }
        format.json { render :show, status: :ok, location: @dummyrank }
      else
        format.html { render :edit }
        format.json { render json: @dummyrank.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dummyranks/1
  # DELETE /dummyranks/1.json
  def destroy
    @dummyrank.destroy
    respond_to do |format|
      format.html { redirect_to dummyranks_url, notice: 'Dummyrank was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dummyrank
      @dummyrank = Dummyrank.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dummyrank_params
      params.require(:dummyrank).permit(:rankname, :content)
    end
end
