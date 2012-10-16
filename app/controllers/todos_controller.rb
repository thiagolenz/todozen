class TodosController < ApplicationController
  respond_to :html, :json
  before_filter :new_todo, :except => [:create]
  def index
    @todos = Todo.all
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
    @todos = Todo.last(params[:tag])
    render :action => 'index'
  end

  private
  def new_todo
    @todo = Todo.new(done: false)
  end
end