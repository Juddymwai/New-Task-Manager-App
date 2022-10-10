class TasksController < ApplicationController

    before_action :authorize
    before_action :authorize_admin
    skip_before_action :authorize_admin, only:[:index]


    # def show 
    #     task = Task.find_by(id: session[:user_id])
        
    #     if task
    #         render json: task
    #     else
    #         render json: { error: "Not authorized" }, status: :unauthorized
    #     end

    # end

    def index 
        task= Task.all 
        render json: task
    end 

    def create 
        user = User.find(session[:user_id])
        render json: {error: "not authorised"} unless user

        task = user.task.create(task_params)
        render json: task
      
    end

    # def update
    #     task = Task.find(params[:task_id])
    #     task.update(task_params)
    
    #     if task
          
        
    #       render json: task
    #     else
    #       render json: task.errors, status: :unprocessable_entity
    #     end
    #   end

    # def destroy 

    #     task = Task.find(params[:task_id]) 
    #     # if task
    #     #     task.destroy(task_params)
    #     #     head :no_content
    #     # else 
    #     #     render json: {error: "task not found"}, status: :not_found

    #     # end
        
    # end

    private 

    def task_params 
        params.require(:task).permit(:title, :duration, :user_id)

    end
    # def find_task  
    #     task = Task.find(params[:id])

    # end 
end
