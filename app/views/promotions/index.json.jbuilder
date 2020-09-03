# frozen_string_literal: true

json.array! @promotions, partial: 'promotions/promotion', as: :promotion
