class PortalController < ApplicationController
  def index
    @ques=Portal.all
  end

  def add
  end
  
  def create
    if current_member
     @p=Portal.new(portal_params)
     @p.userid=current_member.email
     @p.viewno=0
     @p.save
     redirect_to portal_index_path
   else
    redirect_to new_member_session_path
  end
  end

  def delete
  #  binding.pry
    @p=Portal.find(params[:id])
   # binding.pry
   # if @p.userid==current_member.email
    @p.delete
    redirect_to portal_index_path
  #else
    #redirect_to new_member_session_path
  #end
   #redirect_to portal_index_path
  end

  def edit
  end



  def answer
    #not used
    @a=Portal.find_by(params[:id])
  end

 
  def viewcount
    #binding.pry
    @portal = Portal.find(params[:id])
    @portal.viewno+=1
    if @portal.save
    redirect_to answer_index_path(@portal.id)
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

