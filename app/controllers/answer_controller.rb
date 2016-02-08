class AnswerController < ApplicationController
	def create
    if current_member
     # binding.pry
		  @a = Answer.new(answer_params)
    	@por=Portal.find_by(params[:id])
    	 #binding.pry
       @a.uid=current_member.email
    	 @a.qid=@por.id
    	 @a.save

       @r=Recent.new
       @r.userid=current_member.email
       @r.ans=("answered "+@a.ans)
       @r.save
       redirect_to portal_index_path
     else 
      redirect_to new_member_session_path
    end
	end
  
  def index
    #binding.pry
    @ques=Portal.find(params[:id])
    @ans=Answer.where(:qid =>@ques.id)
  end

	def answer_params
    	params.require(:answer).permit(:qid,:uid,:ans)
  	end
	def portal_params
		params.require(:portal).permit(:ques,:viewno,:userid)
	end
  
end
