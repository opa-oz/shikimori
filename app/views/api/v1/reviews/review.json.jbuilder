topic_view = Topics::ReviewView.new @resource.maybe_topic(locale_from_host), false, false

json.id topic_view.topic.id
json.content JsExports::Supervisor.instance.sweep(
  render(
    partial: 'topics/topic',
    collection: [topic_view],
    as: :topic_view,
    cached: ->(entry) { CacheHelper.keys entry },
    formats: :html
  )
)

json.JS_EXPORTS JsExports::Supervisor.instance.export(current_user)
