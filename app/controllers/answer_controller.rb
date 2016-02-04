class AnswerController < ApplicationController
	def create
		@a = Answer.new(answer_params)
    	@por=Portal.find_by(params[:id])
    	#binding.pry
       	@a.uid=current_member.email
    	@a.qid=@por.id
    	
    	@a.save
	end
  
  def index
    @ans=Answer.all
  end

	def answer_params
    	params.require(:answer).permit(:qid,:uid,:ans)
  	end
	def portal_params
		params.require(:portal).permit(:ques,:viewno,:userid)
	end
  	
end
