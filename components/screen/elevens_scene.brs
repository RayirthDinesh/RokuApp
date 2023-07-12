sub init()
    ? "[elevens] init"
    m.gamename = m.top.findNode("gamename")
    m.play1 = m.top.findNode("play1")
    m.play2 = m.top.findNode("play2")

    state = 1
    m.global.addFields({state:state})

    'm.play.observeField("buttonSelected", "onPlaySelected")
    m.play1.setFocus(true)
    m.top.observeField("visible", "onVisibleChange")
end sub

function onVisibleChange(obj)
    ? "[elevens] onVisibleChanged"
    if m.top.visible then
        m.play1.setFocus(true)
        m.gamename.text = "Play"
    end if
end function

sub onPlaySelected(obj)
    ? "[elevens] onPlaySelected"
    m.gamename.text = "Play Selected"
end sub

function onKeyEvent(key, press) as Boolean
    ? "[Elevens_scene] onKeyEvent" key, press
    if m.global.state = 1 then
    if key ="right" and press then
        m.play1.setFocus(true)
    else if key ="left" and press then
        m.play2.setFocus(true)
    end if
end if

    return false
end function