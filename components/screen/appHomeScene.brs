sub init()
    ? "[appHomeScene]] init"
    m.top.observeField("visible", "onVisibleChange")
    m.tictactoe = m.top.findNode("tictactoe")
    m.elevens = m.top.findNode("elevens")
    m.flappybirdLabel = m.top.findNode("flappybirdLabel")

    m.tictactoe.setFocus(true)
  end sub
  
  function onVisibleChange(obj)
    ? "[appHomeScene] onVisibleChanged"
    if m.top.visible = true then
        m.tictactoe.setFocus(true)
    end if
  end function

  function onKeyEvent(key, press) as Boolean
    ? "[appHomeScene] onKeyEvent" key, press
      if key ="right" and press then
        m.elevens.setFocus(true)
        return true
      else if key ="left" and press then
        m.tictactoe.setFocus(true)
        return true
      else if key = "down" and press then
        m.flappybirdLabel.setFocus(true)
        return true
      end if
      
    return false
  end function