window.behaviorSelector = (selector) ->
  "*[data-behavior~=#{selector}]"

window.$b = (behavior_name) ->
  $ behaviorSelector(behavior_name)
