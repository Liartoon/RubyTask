class TasksController < ApplicationController
    def edit
        @task=Task.find(params[:id])
    end
    def update
        @task=Task.find(params[:id])
        if @task.update(task_params) 
            redirect_to task_path
        else
            render "edit"
        end
    end
    
    def task_params
         params.require(:task).permit(:subject, :assignee_id, :status, :description, :created_by_id, :type)
    end
    
    def destroy
        @task=Task.find(params[:id])
        @task.destroy

        redirect_to root_path
    end

    def new

    end
    
    def createcomment
        @comment = Comment.new(comment_params)
        @comment.save
        redirect_to task_path

    end
    def comment_params
        params.require(:comment).permit(:sender,:comment_text,:ta_duty_id,:ta_duty_type)
    end

    def create
        @task = Task.new(task_params)
        if @task.save
            redirect_to root_path
          else
            render 'new'
          end
    end

    def show
        @task=Task.find(params[:id])
    end
end
