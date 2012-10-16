class TodosController < ApplicationController
  respond_to :html, :json
  before_filter :new_todo, :except => [:create]

  def index
    @todos = Todo.undone_tasks
    respond_with @todos
  end

  def new
  end

  def create
    @todo = Todo.new(params[:todo], done: false)
    @todo.save
    redirect_to :action => "index"
  end

  def tag
    @todos = Todo.undone_tagged_with(params[:tag])
    render :action => 'index'
  end

  private
  def new_todo
    @todo = Todo.new(done: false)
  end
end