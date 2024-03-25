class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show edit update destroy ]

  # GET /messages or /messages.json
  def index
    @discussion = Discussion.find(params[:discussion_id])
    @messages = @discussion.messages
  end

  # GET /messages/1 or /messages/1.json
  def show
    @message = Message.find(params[:id])
    @discussion = @message.discussion
  end

  # GET /messages/new
  def new
    @discussion = Discussion.find(params[:discussion_id])
    @message = @discussion.messages.new
  end

  # GET /messages/1/edit
  def edit
    @discussion = Discussion.find(params[:discussion_id])
    @messages = @discussion.messages
  end

  # POST /messages or /messages.json
  def create
    @discussion = Discussion.find(params[:discussion_id])
    @message = @discussion.messages.build(message_params) # Utilisez 'messages.build' ici
    @message.user = current_user
    # ... le reste de l'action create ...
    #@message = Message.new(message_params)
    #@discussion = Discussion.find(params[:discussion_id])
    #@message = current_user.message.build(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to discussion_message_path(@discussion, @message), notice: "Message was successfully created." }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1 or /messages/1.json
  def update
    @discussion = Discussion.find(params[:discussion_id])
    @messages = @discussion.messages
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to discussion_message_path(@discussion, @message), notice: "Message was successfully updated." }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1 or /messages/1.json
  def destroy
    @discussion = Discussion.find(params[:discussion_id])
    @message = @discussion.messages.find(params[:id])
    @message.destroy
  
    respond_to do |format|
      format.html { redirect_to discussion_messages_path(@discussion), notice: "Message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:contenu, :user_id, :discussion_id)
    end
end