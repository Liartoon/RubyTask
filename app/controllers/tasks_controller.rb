class TasksController < ApplicationController
    def edit

    end
    def new

    end
    def create
        
    end
    def show
        @task=Task.find(params[:id])
    end
end
