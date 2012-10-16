class TodosController < ApplicationController
  respond_to :html, :json
  before_filter :new_todo, :except => [:create]
  after_filter :new_todo, :only => [:done]

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

  def done
    puts "SADSADAAS" + request.referer
    @todo = Todo.undone_tasks.find(params[:id])
    if not @todo.nil?
      @todo.done = true
      @todo.save
    end
    redirect_to :action => "index"
    # session[:return_to] = request.referer
  end

  private
  def new_todo
    @todo = Todo.new(done: false)
  end
end