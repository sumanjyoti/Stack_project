class PortalController < ApplicationController
  def index
    @ques=Portal.all
  end

  def add
  end
  
  def create
     @p=Portal.new(portal_params)
     @p.userid=current_member.email
     @p.viewno=0
     @p.save
     redirect_to portal_index_path
  end

  def delete
    #binding.pry
    @p=Portal.find_by(params[:id])
    @p.destroy
   redirect_to portal_index_path
  end

  def edit
  end

  def answer
    @a=Portal.find_by(params[:id])
   # @ans=@a.answer.all
  end

 
  def viewcount
    @portal = Portal.find_by(params[:id])
    @portal.viewno+=1
    #binding.pry
    if @portal.save
    #if @portal.update(params[:portal].permit(:ques,:viewno,:userid))
    redirect_to answer_index_path
    else
    redirect_to portal_index_path
  end
  def showans
  end

  end

  private 
  def portal_params
    params.require(:portal).permit(:ques,:viewno,:userid)
  end


  def answer_params
    params.require(:answer).permit(:qid,:uid,:ans)
  end

end

