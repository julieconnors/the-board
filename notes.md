Models

User
    - name
    - email
    - password
    - type - owner, rider

Owner
    - name
    has_many :horses

Horse
    - name
    - age
    
    belongs_to :owner
    has_many :rides
    has_many :riders, through :rides

Ride
    - time
    - location
    - notes
    belongs_to :horse
    belongs_to :rider

Rider
    - name
    - barn
    has_many rides
    has_many :horses, through :rides

Login as Rider
    - add rides

Login as Owner
    - add horses

rails g model user email:string password_digest:string type:string name:string --no-test-framework


Resources
- owner [:new, :create, :show, :index, :delete, :update, :edit]
~ nested resource horse [:new, :create, :show, :index, :delete, :update, :edit]

- rider [:new, :create, :show, :index, :delete, :update, :edit]
~ nested resource ride [:new, :create, :show, :index, :delete, :update, :edit]

get "register", to: "users#new" 
get "login", to: "sessions#new"
post "login", to: "session#create"
post "logout", to: "session#destroy"


