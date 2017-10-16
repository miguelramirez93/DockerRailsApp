Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	namespace :v1 do 
  		
    		get 'person', to: 'person#getPersons'
    		post 'person', to: 'person#createPerson'
    		put  'person', to: 'person#updatePerson'
    		delete 'person', to: 'person#deletePerson'
    	
    end 
end 
