Todozen::Application.routes.draw do
  resources :todos, :only => [:new, :create, :index, :tag, :done]
  match 'todos/:tag' => 'todos#tag'
  match 'todos/:id/done' => 'todos#done'
  root :to => redirect('/todos')
end
