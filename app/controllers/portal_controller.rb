class PortalController < ApplicationController
  def index
  
    @ques=Portal.all
  
  end
  def recent_act
   #binding.pry
    @rec= Recent.order("id DESC").all
    respond_to do |format|
        format.js{ }
      end
  end

  def add
  end
  
  def create
    if current_member
     @p=Portal.new(portal_params)
     @p.userid=current_member.email
     @p.viewno=0
     @p.save
     @r=Recent.new(portal_params)
     @r.userid=current_member.email
     @r.ques=("posted "+@p.ques)
     @r.save
     redirect_to portal_index_path
   else
    redirect_to new_member_session_path
  end
  end

  def delete
  #  binding.pry
    @p=Portal.find(params[:id])
    @r=Recent.new
    @r.userid=current_member.email
    @r.ques=("deleted "+@p.ques)
    @r.save
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
    @r=Recent.new
    
     @r.userid=current_member.email
     @r.vques=("viewed " + @portal.ques)
     @r.save
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

