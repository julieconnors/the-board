Models

User/Trainer
    - name
    - email
    - password

    has_many :riders
    rails g model owner name:string --no-test-framework

Horse
    - name
    - owner
    
    has_many :rides
    has_many :riders, through :rides

    rails g model horse name:string --no-test-framework

Ride
    - time
    - location
    - notes
    belongs_to :horse
    belongs_to :rider

    rails g model ride time:datetime location:string notes:text --no-text-framework

Rider
    - name

    belongs_to :trainer
    has_many rides
    has_many :horses, through :rides

    rails g resource rider name:string barn:string --no-test-framework

Login as Rider
    - add rides

Login as Owner
    - add horses

rails g model user email:string password_digest:string type:string name:string --no-test-framework

Removed from layout file****
<%= javascript_pack_tag 'application', 'data-turbolinks-track': 'reload' %>



Resources
- owner [:new, :create, :show, :index, :delete, :update, :edit]
~ nested resource horse [:new, :create, :show, :index, :delete, :update, :edit]

- rider [:new, :create, :show, :index, :delete, :update, :edit]
~ nested resource ride [:new, :create, :show, :index, :delete, :update, :edit]

get "register", to: "users#new" 

get "login", to: "sessions#new"
post "login", to: "session#create"
post "logout", to: "session#destroy"




