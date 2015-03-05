class ChartsController < ApplicationController
  def celebrity_votes_graph
    celeb = Celebrity.find(celebrity)
    votes = celeb.celebrity_votes.group(:vote_value).count
    total_votes = celeb.celebrity_votes.group(:vote_value)

    if total_votes > 0
      render json:
        {"A List" => (votes[1].nil? ? 0 : votes[1]) / total_votes.to_f,
         "B List" => (votes[2].nil? ? 0 : votes[2]) / total_votes.to_f,
         "C List" => (votes[3].nil? ? 0 : votes[3]) / total_votes.to_f,
         "D List" => (votes[4].nil? ? 0 : votes[4]) / total_votes.to_f
        }
    else
      render json: {}
    end

  end
end
