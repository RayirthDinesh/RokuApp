sub init()
  ? "[tictactoe] init" ' essentially a print statment that is called only once
  m.top.backgroundURI = "pkg:/images/background.png"

  m.gamename = m.top.findNode("gamename")
  m.poster = m.top.findNode("tictactoe")

  m.playerNotify = m.top.findNode("playerNotify")
  m.global.addFields({playerNotify: m.playerNotify})
'variables that we call from XML and we want to edit
  r0c0 = m.top.findNode("r0c0")
  r0c1 = m.top.findNode("r0c1")
  r0c2 = m.top.findNode("r0c2")

  r1c0 = m.top.findNode("r1c0")
  r1c1 = m.top.findNode("r1c1")
  r1c2 = m.top.findNode("r1c2")

  r2c0 = m.top.findNode("r2c0")
  r2c1 = m.top.findNode("r2c1")
  r2c2 = m.top.findNode("r2c2")
'makes the functions global
  m.global.addFields({r0c0: r0c0})
  m.global.addFields({r0c1: r0c1})
  m.global.addFields({r0c2: r0c2})

  m.global.addFields({r1c0: r1c0})
  m.global.addFields({r1c1: r1c1})
  m.global.addFields({r1c2: r1c2})

  m.global.addFields({r2c0: r2c0})
  m.global.addFields({r2c1: r2c1})
  m.global.addFields({r2c2: r2c2})

'if player is true
  m.xPlayer = true

  m.global.addFields({xPlayer: m.xPlayer})

  arrayButtonsCalled = [
    [false,false,false],
    [false,false,false],
    [false,false,false]
  ]

  rowIndex = 1
  colIndex = 1

  arrayButtons = [
    [r0c0,r0c1,r0c2],
    [r1c0,r1c1,r1c2],
    [r2c0,r2c1,r2c2]
  ]

  rightButtons = [r0c0,r1c0,r2c0,r0c1,r1c1,r2c1]
  leftButtons = [r0c2,r1c2,r2c2,r0c1,r1c1,r2c1]
  upButtons = [r2c0,r2c1,r2c2,r1c0,r1c1,r1c2]
  downButtons = [r0c0,r0c1,r0c2,r1c0,r1c1,r1c2]

  m.global.addFields({arrayButtonsCalled : arrayButtonsCalled})
  m.global.addFields({arrayButtons : arrayButtons})
  m.global.addFields({rowIndex : rowIndex})
  m.global.addFields({colIndex : colIndex})
  m.global.addFields({rightButtons : rightButtons})
  m.global.addFields({leftButtons : leftButtons})
  m.global.addfields({upButtons : upButtons})
  m.global.addFields({downButtons : downButtons})

  r1c1.setFocus(true) 'setfocus starts at the middle grid
end sub

sub onButtonSelected()
  ? "[tictactoe] onButtonSelected"

end sub

function checkinList(list, button) as Boolean
  for each item in list
    if item.isSameNode(button) then
      return true
    end if
  end for
  return false
end function

function test() as Boolean
  ? "[tictactoe] test"
  return false
end function


'function
'deals with the different types of presses and when the user moves to different buttons and hover

'followingconditionals will also deal with how a user will move to different grids, then what happens if they do
function onKeyEvent(key, press) as Boolean
  ? "[tictactoe] onKeyEvent" key, press
  if press then
    if key = "right" then
      if checkinList(m.global.rightButtons, m.global.arrayButtons[m.global.rowIndex][m.global.colIndex])
        m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].setFocus(false)
        m.global.colIndex = m.global.colIndex + 1
        m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].setFocus(true)
      end if
    else if key = "up" then
      if checkinList(m.global.upButtons, m.global.arrayButtons[m.global.rowIndex][m.global.colIndex])
        m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].setFocus(false)
        m.global.rowIndex = m.global.rowIndex - 1
        m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].setFocus(true)
      end if
    else if key = "down" then
      if checkinList(m.global.downButtons, m.global.arrayButtons[m.global.rowIndex][m.global.colIndex])
        m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].setFocus(false)
        m.global.rowIndex = m.global.rowIndex + 1
        m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].setFocus(true)
      end if
    else if key = "left" then
      if checkinList(m.global.leftButtons, m.global.arrayButtons[m.global.rowIndex][m.global.colIndex])
        m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].setFocus(false)
        m.global.colIndex = m.global.colIndex - 1
        m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].setFocus(true)
      end if
    end if
  else
    if key = "OK" then
      if m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].iconUri = "pkg:/images/blank.png" then
        if m.global.xPlayer then
          m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].iconUri = "pkg:/images/whiteX.jpg"
          m.global.xPlayer = false
          m.global.playerNotify.text = "Player O's Turn"
          m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].focusedIconUri = "pkg:/images/redX.jpg"
        else
          m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].iconUri = "pkg:/images/whiteO.jpg"
          m.global.xPlayer = true
          m.global.playerNotify.text = "Player X's Turn"
          m.global.arrayButtons[m.global.rowIndex][m.global.colIndex].focusedIconUri = "pkg:/images/redO.jpg"
        end if
      end if
    end if
  end if
end function