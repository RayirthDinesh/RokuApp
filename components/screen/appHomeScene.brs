sub init()
    ? "[appHomeScene]] init"
    m.top.observeField("visible", "onVisibleChange")
    m.tiktok = m.top.findNode("tiktok")
    m.elevens = m.top.findNode("elevens")
    m.flappy = m.top.findNode("flappy")

    m.tiktok.setFocus(true)
  end sub
  
  function onVisibleChange(obj)
    ? "[appHomeScene] onVisibleChanged"
    if m.top.visible = true then
        m.tiktok.setFocus(true)
    end if
  end function

  function onKeyEvent(key, press) as Boolean
    ? "[appHomeScene] onKeyEvent" key, press
      if key ="right" and press then
        m.elevens.setFocus(true)
        return true
      else if key ="left" and press then
        m.tiktok.setFocus(true)
        return true
      else if key = "down" and press then
        m.flappy.setFocus(true)
        return true
      else if key = "up" and press then
        if m.flappy.hasFocus() then
          m.tiktok.setFocus(true)
          return true
        end if
      end if

    return false
  end function