json.extract! guest_queue, :id, :name, :no, :ticket_type, :created_at, :updated_at
json.url guest_queue_url(guest_queue, format: :json)