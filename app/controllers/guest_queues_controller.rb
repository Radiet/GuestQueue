class GuestQueuesController < ApplicationController
  before_action :set_guest_queue, only: [:show, :edit, :update, :destroy]
  before_action :set_next_queue_numbers, only: [:new, :edit, :create]

  # GET /guest_queues
  # GET /guest_queues.json
  def index
    @guest_queues = GuestQueue.all
  end

  # GET /guest_queues/1
  # GET /guest_queues/1.json
  def show
  end

  # GET /guest_queues/new
  def new
    @guest_queue = GuestQueue.new()
  end

  # GET /guest_queues/1/edit
  def edit
  end

  # POST /guest_queues
  # POST /guest_queues.json
  def create
    @guest_queue = GuestQueue.new(guest_queue_params.merge({no: @next_queue_numbers[params[:guest_queue][:ticket_type]]}))

    respond_to do |format|
      if @guest_queue.save
        format.html { redirect_to @guest_queue, notice: 'Guest queue was successfully created.' }
        format.json { render :show, status: :created, location: @guest_queue }
      else
        format.html { render :new }
        format.json { render json: @guest_queue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guest_queues/1
  # PATCH/PUT /guest_queues/1.json
  def update
    respond_to do |format|
      if @guest_queue.update(guest_queue_params)
        format.html { redirect_to @guest_queue, notice: 'Guest queue was successfully updated.' }
        format.json { render :show, status: :ok, location: @guest_queue }
      else
        format.html { render :edit }
        format.json { render json: @guest_queue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guest_queues/1
  # DELETE /guest_queues/1.json
  def destroy
    @guest_queue.destroy
    respond_to do |format|
      format.html { redirect_to guest_queues_url, notice: 'Guest queue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guest_queue
      @guest_queue = GuestQueue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guest_queue_params
      params.require(:guest_queue).permit(:name, :no, :ticket_type)
    end

    def set_next_queue_numbers
      @next_queue_numbers = get_next_queue
    end

    def get_next_queue
      current_count = GuestQueue.group(:ticket_type).count
      hash = {}

      GuestQueue::LOCKET_TYPE
        .each { |type| hash[type] = current_count[type].to_i + 1  }

      hash
    end
end
