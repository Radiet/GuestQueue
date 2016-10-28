class GqueuesController < ApplicationController
  before_action :set_gqueue, only: [:show, :edit, :update, :destroy]

  # GET /gqueues
  # GET /gqueues.json
  def index
    @gqueues = Gqueue.all
  end

  # GET /gqueues/1
  # GET /gqueues/1.json
  def show
  end

  # GET /gqueues/new
  def new
    @gqueue = Gqueue.new
  end

  # GET /gqueues/1/edit
  def edit
  end

  # POST /gqueues
  # POST /gqueues.json
  def create
    @gqueue = Gqueue.new(gqueue_params)

    respond_to do |format|
      if @gqueue.save
        format.html { redirect_to @gqueue, notice: 'Gqueue was successfully created.' }
        format.json { render :show, status: :created, location: @gqueue }
      else
        format.html { render :new }
        format.json { render json: @gqueue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gqueues/1
  # PATCH/PUT /gqueues/1.json
  def update
    respond_to do |format|
      if @gqueue.update(gqueue_params)
        format.html { redirect_to @gqueue, notice: 'Gqueue was successfully updated.' }
        format.json { render :show, status: :ok, location: @gqueue }
      else
        format.html { render :edit }
        format.json { render json: @gqueue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gqueues/1
  # DELETE /gqueues/1.json
  def destroy
    @gqueue.destroy
    respond_to do |format|
      format.html { redirect_to gqueues_url, notice: 'Gqueue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gqueue
      @gqueue = Gqueue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gqueue_params
      params.require(:gqueue).permit(:name, :no, :locket_type)
    end
end
