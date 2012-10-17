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
    redirect_to :action => "index" if @todo.save
  end

  def tag
    @todos = Todo.undone_tasks
    @tag.each do |t|
      @todos = @todos.undone_tagged_with t
    end
    render :action => 'index'
  end

  def done
    @todo = Todo.undone_tasks.find(params[:id])
    if not @todo.nil?
      @todo.done = true
      @todo.save
    end
    redirect_to :back
  end

  private
  def prepare_todo
    @tag = params[:tags].split('/') if not params[:tags].nil?
    @todo = Todo.new(done: false, desc: @tag.nil? ? "" : "##{@tag.join(' #')} ")
    @tags = []
    Todo.undone_tasks.each do |t|
      t.desc.scan(/(?:^|\s)#(\w+)/i).transpose.each do |tag|
        @tags << tag
      end
    end
    @tags = @tags.flatten.uniq
  end
end