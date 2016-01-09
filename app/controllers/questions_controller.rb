class QuestionsController < ApplicationController
  #before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def question_params
    params.require(:question).permit(:title, :content, :questionuser, :articleid, :field, :filepath, :liker, :obligate1, :obligate2, :obligate3)
  end
  def index
    @questions = Question.all
  end
  def manage
      @uid=session[:user_id]
      @username=User.where(:id => @uid).first.name
      @questions=Question.where(:questionuser => 'yuan')
  end
  def ban
      @qid = params[:qid]
      @state =Question.where(:id=>@qid).first.state
      if(@state == nil ||@state==0) then
         Question.update(@qid,:state => '1')
      else
         Question.update(@qid,:state => '0')
      end
      @uid=session[:user_id]
      @username=User.where(:id => @uid).first.name
      @questions=Question.where(:questionuser => 'yuan')
  end
  def addquestion
    @flag=0
    @uid=session[:user_id]
    @uname=User.where(:id => @uid).first.name
    @id=params[:sid]
    if(@id==1)
      @field="computer"
    elsif (@id==2)
      @field="software"
    elsif (@id==3)
      @field="internet"
    end
    @title=params[:text]
    @article=params[:atext]
    @content=params[:content]
    @flag=Article.where(:title => @article).count
    if(@flag==0)
      redirect_to :action =>"index"
    else
    @aid=Article.where(:title => @article).first.id
    @new_question=Question.create(:article_id => @aid,:title => @title,:content => @content,:questionuser => @uname,:field =>@field)
    @questions=Question.all
    end
  end      
  def search
    @flag=0
    @text=params[:text]
    @type=params[:type]
    if(@text=="") then
      redirect_to :action => "index"
    else
     #if(Article.where(:author => @text).first==nil) then
      #redirect_to :action => "index"
     #else
       #@need=Article.where(:author => @text)
       
       #@question = @need.first.questions.first.id
       #@need.each do |need|
       #@question=@need.first.questions.first.id
       #nd
     #end
    if(@type=="author")
    @need=Question.find_by_sql("select * from questions,articles where questions.article_id=articles.id and articles.author='"+@text+"'")
    #@need=@need.first.id
     if(@need==[])
       @flag=1
     end
    elsif(@type=="field")
     @need=Question.find_by_sql("select * from questions,articles where questions.article_id=articles.id and articles.field='"+@text+"'")
     #@need=@need.first.id
     if(@need==[])
       @flag=1
     end
    elsif(@type=="keyword")
     @need=Question.find_by_sql("select * from questions,articles where questions.article_id=articles.id and articles.keyword='"+@text+"'")
     #@need=@need.first.id
     if(@need==[])
       @flag=1
     end
    end 
    end
  end
  def addanswer
   @content=params[:content]
   if(session[:qid]||session[:user_id]) then
   @qid=session[:qid]
   @uid=session[:user_id]
   @question=Question.find(@qid)
   @user=User.find(@uid).name
   if(Answer.where(:question => @question).first!=nil)
   @num=Answer.where(:question => @question).order("level").last.level+1
   else
   @num=1
   end
   @new_answer=Answer.create(:question => @question,:level => @num,:content => @content,:answeruser => @user)
   @answers=Answer.where(:question => @question)
   else
   puts "session overtime"
   redirect_to user
   end
  end
  # GET /questions/1
  # GET /questions/1.json
  def show
   @id=params[:qid]
   @question=Question.find(@id)
   session[:qid]=@id
   @answers=Answer.where(:question_id => @id)
  end
  def like
    @qid = session[:qid]
    @uid = session[:user_id]
    @question=Question.find(@qid)
    @exist=Like.where(:user_id => @uid).where(:question_id=>@qid).count
    if(@exist==0) then
    @new_like=Like.create(:question_id =>@qid,:user_id =>@uid)
    else
    @lid=Like.where(:user_id => @uid).where(:question_id => @qid).first.id
    Like.delete(@lid)
    end  
    @answers=Answer.where(:question_id => @qid).order("level")
  end
  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    #def set_question
     # @question = Question.find(params[:id])
    #end

    # Never trust parameters from the scary internet, only allow the white list through.
   
end
