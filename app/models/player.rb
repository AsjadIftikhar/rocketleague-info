require 'elasticsearch/model'

class Player < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :team

  mapping do
    indexes :name, type: :text
    indexes :age, type: :integer
    indexes :country, type: :text
  end

  def as_indexed_json(options = {})
    self.as_json(only: [:name, :age, :country],
                 include: {
                   team: { only: [:id, :name] }
                 })
  end

  class << self
    def custom_search(query)
      # multi_search_params = {
      #   query: {
      #     multi_match: {
      #       query: query,
      #       fields: %w[name teams.name],
      #       operator: "and"
      #     }
      #   }
      # }
      __elasticsearch__.search(query)
    end
    
  end
end
