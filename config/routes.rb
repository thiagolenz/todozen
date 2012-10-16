Todozen::Application.routes.draw do
  resources :todos, :only => [:new, :create, :index, :tag]
  match 'todos/:tag' => 'todos#tag'
  root :to => redirect('/todos')
end
