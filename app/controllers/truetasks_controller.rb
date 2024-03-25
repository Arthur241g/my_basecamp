class TruetasksController < ApplicationController
  before_action :set_truetask, only: %i[ show edit update destroy ]

  # GET /truetasks or /truetasks.json
  def index
    @truetasks = Truetask.all
  end

  # GET /truetasks/1 or /truetasks/1.json
  def show
  end

  # GET /truetasks/new
  def new
    @truetask = Truetask.new
  end

  # GET /truetasks/1/edit
  def edit
  end

  # POST /truetasks or /truetasks.json
  def create
    @truetask = Truetask.new(truetask_params)


    respond_to do |format|
      if @truetask.save
        format.html { redirect_to truetask_url(@truetask), notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @truetask }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @truetask.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /truetasks/1 or /truetasks/1.json
  def update
    respond_to do |format|
      if @truetask.update(truetask_params)
        format.html { redirect_to truetask_url(@truetask), notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @truetask }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @truetask.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /truetasks/1 or /truetasks/1.json
  def destroy
    @truetask.destroy!

    respond_to do |format|
      format.html { redirect_to truetasks_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_truetask
      @truetask = Truetask.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def truetask_params
      params.require(:truetask).permit(:name, :description, :done)
    end
end
