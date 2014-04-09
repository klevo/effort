window.behavior_selector = (selector) ->
  "*[data-behavior~=#{selector}]"

window.$b = (behavior_name) ->
  $ behavior_selector(behavior_name)
