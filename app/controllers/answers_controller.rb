class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
  end
  def like
    @aid = params[:aid]
    @uid = session[:user_id]
    @qid = session[:qid]
    @question=Question.find(@qid)
    @exist=Like.where(:user_id => @uid).where(:answer_id=>@aid).count
    if(@exist==0) then
    @new_like=Like.create(:answer_id =>@aid,:user_id =>@uid)
    else
    @lid=Like.where(:user_id => @uid).where(:answer_id => @aid).first.id
    Like.delete(@lid)
    end  
    @answers=Answer.where(:question_id => @qid).order("level")
  end
  def reply
   @alevel=params[:alevel]
   @qid=session[:qid]
   if(@qid!=nil) then
     @question=Question.find(@qid)
     @answers=Answer.where(:question_id => @qid).order("level")
   else
     puts "nil"
   end
  end
  # GET /answers/1
  # GET /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    @answer = Answer.new
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = Answer.new(answer_params)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to @answer, notice: 'Answer was successfully created.' }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:questionid, :level, :title, :content, :answeruser, :filepath, :liker, :obligate1, :obligate2, :obligate3)
    end
end
