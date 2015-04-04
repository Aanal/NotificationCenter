class MessageController < ApplicationController

def new
	@message = Message.new
	
end

def show
	@message = Message.last
end	

def temp
end	


def create
	@message = Message.new(Title: params[:Title], Text: params[:Text])
	@message.save!
	redirect_to filter_message_path
	
end	

def filter
	
   @search = User.search(params[:q])
   @users = @search.result
   @search.build_condition if @search.conditions.empty?
   @sortsearch.build_sort if not @search.sorts.empty?
   

end

	
end
