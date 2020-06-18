class CandidatesController < ApplicationController
    before_action :find_candidate, only: [:show, :edit, :update, :destroy, :vote]
    def index
        @candidates = Candidate.all
        @candidate = Candidate.young_people
    end

    def new
        @candidate = Candidate.new
    end

    def show
       
    end
    
    def create

       @candidate = Candidate.new(candidate_params)

       if @candidate.save
        redirect_to '/candidates', notice: 'Candidate Created!'
       else
        render :new
       end
    end

    def edit
       
    end 
    
    def update
       

        if @candidate.update(candidate_params)    
            redirect_to '/candidates', notice: 'Candidate Updated'
        else
            render :edit
        end    
    end
    
    def destroy
        
        @candidate.destroy
        redirect_to '/candidates', notice: 'Candidate Deleted'
    end    

    def vote
        

        # VoteLog.create(candidate: @candidate, ip_address: request.remote_ip) （另一種寫法）

        @candidate.vote_logs.create(ip_address: request.remote_ip)
        redirect_to '/candidates', notice: 'Successfully voted'
    end 

    private
    def candidate_params
        params.require(:candidate).permit(:name, :party, :age, :policy)
    end

    def find_candidate
        @candidate = Candidate.find_by(id: params[:id])
    end    
end