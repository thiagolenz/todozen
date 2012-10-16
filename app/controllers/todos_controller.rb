class TodosController < ApplicationController
  respond_to :html, :json
  before_filter :prepare_todo, :except => [:create]
  after_filter :prepare_todo, :only => [:done]

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
    @tag = params[:tag]
    @todos = Todo.undone_tagged_with @tag
    render :action => 'index'
  end

  def done
    @todo = Todo.undone_tasks.find(params[:id])
    if not @todo.nil?
      @todo.done = true
      @todo.save
    end
    redirect_to :action => "index"
    # session[:return_to] = request.referer
  end

  private
  def prepare_todo
    @todo = Todo.new(done: false)
    @tags = []
    Todo.undone_tasks.each do |t|
      t.desc.scan(/(?:^|\s)#(\w+)/i).transpose.each do |tag|
        @tags << tag
      end
    end
    @tags = @tags.transpose.uniq
  end
end