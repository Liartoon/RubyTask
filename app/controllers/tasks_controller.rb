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
        if current_auth_user.type == "Admin"
            params.require(:task).permit(:subject, :assignee_id, :status, :description, @task.created_by_id, :type)
        else
            params.require(:task).permit(:subject, :assignee_id, :status, :description, @task.created_by_id, :type)
        end
    end
    
    def destroy
        @task=Task.find(params[:id])
        @task.destroy

        redirect_to root_path
    end

    def new

    end
    def create
        @task = Task.new(task_params)
        if @task.save
            redirect_to @task, notice: "The task was created!"
          else
            render 'new'
          end
    end
    def show
        @task=Task.find(params[:id])
    end
end
