collection = params[:is_pending] == '1' ? @view.pending : @view.processed

json.content render(
  partial: 'versions/version',
  collection: collection,
  formats: :html
)

if collection.next_page?
  json.postloader render(
    'blocks/postloader',
    filter: 'b-log_entry',
    next_url: @view.next_page_url(params[:is_pending] == '1')
  )
end
