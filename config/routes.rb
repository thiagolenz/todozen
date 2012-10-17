Todozen::Application.routes.draw do
  resources :todos, :only => [:new, :create, :index, :tag, :done]
  match 'todos/*tags' => 'todos#tag'
  match 'done/:id' => 'todos#done'
  root :to => redirect('/todos')
end
