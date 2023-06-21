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

  r0c0Called = false
  r0c1Called = false
  r0c2Called = false

  r1c0Called = false
  r1c1Called = false
  r1c2Called = false

  r2c0Called = false
  r2c1Called = false
  r2c2Called = false

  m.global.addFields({r0c0Called: r0c0Called})
  m.global.addFields({r0c1Called: r0c1Called})
  m.global.addFields({r0c2Called: r0c2Called})

  m.global.addFields({r1c0Called: r1c0Called})
  m.global.addFields({r1c1Called: r1c1Called})
  m.global.addFields({r1c2Called: r1c2Called})

  m.global.addFields({r2c0Called: r2c0Called})
  m.global.addFields({r2c1Called: r2c1Called})
  m.global.addFields({r2c2Called: r2c2Called})

' ' Initialize the array
' ' Define the row and column count
' rowCount = 3
' columnCount = 3

' ' Initialize a two-dimensional array to store the components
' gridComponents = []

' ' Populate the array with the components
' for row = 0 to rowCount - 1
'   rowComponents = []
'   for col = 0 to columnCount - 1
'     componentName = "r" + Str(row) + "c" + Str(col)
'     component = m.top.findNode(componentName)
'     rowComponents[col] = component
'   end for
'   gridComponents[row] = rowComponents
' end for


  ' m.top.setFocus(true)
  r1c1.setFocus(true) 'setfocus starts at the middle grid

  ' For i = 1 to 9

  ' End for

  ' m.r0c0.observeField("buttonSelected", "onButtonSelected")


  diagonalWin1 = m.top.findNode("diagonalWin1")
  diagonalWin2 = m.top.findNode("diagonalWin2")
  Horizontal_Line_Top = m.top.findNode("Horizontal_Line_Top")
  Horizontal_Line_Middle = m.top.findNode("Horizontal_Line_Middle")
  Horizontal_Line_Bottom = m.top.findNode("Horizontal_Line_Bottom")
  Vertical_Line_Top = m.top.findNode("Vertical_Line_Top")
  Vertical_Line_Middle = m.top.findNode("Vertical_Line_Middle")
  Vertical_Line_Bottom = m.top.findNode("Vertical_Line_Bottom")

  m.global.addFields({diagonalWin1: diagonalWin1})
  m.global.addFields({diagonalWin2: diagonalWin2})
  m.global.addFields({Horizontal_Line_Top: Horizontal_Line_Top})
  m.global.addFields({Horizontal_Line_Middle: Horizontal_Line_Middle})
  m.global.addFields({Horizontal_Line_Bottom: Horizontal_Line_Bottom})
  m.global.addFields({Vertical_Line_Top: Vertical_Line_Top})
  m.global.addFields({Vertical_Line_Middle: Vertical_Line_Middle})
  m.global.addFields({Vertical_Line_Bottom: Vertical_Line_Bottom})

end sub

sub onButtonSelected()
  ? "[tictactoe] onButtonSelected"

end sub

'deals with the different types of presses and when the user moves to different buttons and hover

'followingconditionals will also deal with how a user will move to different grids, then what happens if they do
function onKeyEvent(key, press) as Boolean
  ? "[tictactoe] onKeyEvent" key, press
  m.buttonClicked = false
  ' if press
    if m.global.r0c0.hasFocus() then
      if key = "down" and press then
        m.global.r0c0.setFocus(false)
        m.global.r1c0.setFocus(true)
      else if key = "right" and press then
        m.global.r0c0.setFocus(false)
        m.global.r0c1.setFocus(true)
      else if key = "OK" and not m.global.r0c0Called then
          m.buttonClicked = true
          m.global.r0c0Called = true
          if(m.global.xPlayer) then
            m.global.r0c0.iconUri = "pkg:/images/X.jpg"
            m.global.xPlayer = false
          else
            m.global.r0c0.iconUri = "pkg:/images/O.jpg"
            m.global.xPlayer = true
          end if
          Winning()
      end if
    else if m.global.r0c1.hasFocus() then
      if key = "down" and press then
        m.global.r0c1.setFocus(false) 'setfocus also hovers
        m.global.r1c1.setFocus(true)
      else if key = "left" and press then
        m.global.r0c1.setFocus(false)
        m.global.r0c0.setFocus(true)
      else if key = "right" and press then
        m.global.r0c1.setFocus(false)
        m.global.r0c2.setFocus(true)
      else if key = "OK" and not m.global.r0c1Called then
        m.buttonClicked = true
        m.global.r0c1Called = true
        if(m.global.xPlayer) then
          m.global.r0c1.iconUri = "pkg:/images/X.jpg"
          m.global.xPlayer = false
        else
          m.global.r0c1.iconUri = "pkg:/images/O.jpg"
          m.global.xPlayer = true
        end if
        Winning()
      end if
    else if m.global.r0c2.hasFocus() then
      if key = "down" and press then
        m.global.r0c2.setFocus(false)
        m.global.r1c2.setFocus(true)
      else if key = "left" and press then
        m.global.r0c2.setFocus(false)
        m.global.r0c1.setFocus(true)
      else if key = "OK" and not m.global.r0c2Called then
        m.buttonClicked = true
        m.global.r0c2Called = true
        if(m.global.xPlayer) then
          m.global.r0c2.iconUri = "pkg:/images/X.jpg"
          m.global.xPlayer = false
        else
          m.global.r0c2.iconUri = "pkg:/images/O.jpg"
          m.global.xPlayer = true
        end if
        Winning()
      end if
    else if m.global.r1c0.hasFocus() then
      if key = "down" and press then
        m.global.r1c0.setFocus(false)
        m.global.r2c0.setFocus(true)
      else if key = "up" and press then
        m.global.r1c0.setFocus(false)
        m.global.r0c0.setFocus(true)
      else if key = "right" and press then
        m.global.r1c0.setFocus(false)
        m.global.r1c1.setFocus(true)
      else if key = "OK" and not m.global.r1c0Called then
        m.buttonClicked = true
        m.global.r1c0Called = true
        if(m.global.xPlayer) then
          m.global.r1c0.iconUri = "pkg:/images/X.jpg"
          m.global.xPlayer = false
        else
          m.global.r1c0.iconUri = "pkg:/images/O.jpg"
          m.global.xPlayer = true
        end if
        Winning()
      end if
    else if m.global.r1c1.hasFocus() then
      if key = "down" then
        m.global.r1c1.setFocus(false)
        m.global.r2c1.setFocus(true)
      else if key = "up" and press then
        m.global.r1c1.setFocus(false)
        m.global.r0c1.setFocus(true)
      else if key = "left" and press then
        m.global.r1c1.setFocus(false)
        m.global.r1c0.setFocus(true)
      else if key = "right" and press then
        m.global.r1c1.setFocus(false)
        m.global.r1c2.setFocus(true)
      else if key = "OK" and not m.global.r1c1Called then
        m.buttonClicked = true
        m.global.r1c1Called = true
        if(m.global.xPlayer) then
          m.global.r1c1.iconUri = "pkg:/images/X.jpg"
          m.global.xPlayer = false
        else
          m.global.r1c1.iconUri = "pkg:/images/O.jpg"
          m.global.xPlayer = true
        end if
        Winning()
      end if
    else if m.global.r1c2.hasFocus() then
      if key = "down" and press then
        m.global.r1c2.setFocus(false)
        m.global.r2c2.setFocus(true)
      else if key = "up" and press then
        m.global.r1c2.setFocus(false)
        m.global.r0c2.setFocus(true)
      else if key = "left" and press then
        m.global.r1c2.setFocus(false)
        m.global.r1c1.setFocus(true)
      else if key = "OK" and not m.global.r1c2Called then
        m.buttonClicked = true
        m.global.r1c2Called = true
        if(m.global.xPlayer) then
          m.global.r1c2.iconUri = "pkg:/images/X.jpg"
          m.global.xPlayer = false
        else
          m.global.r1c2.iconUri = "pkg:/images/O.jpg"
          m.global.xPlayer = true
        end if
        Winning()
      end if
    else if m.global.r2c0.hasFocus() then
      if key = "up" and press then
        m.global.r2c0.setFocus(false)
        m.global.r1c0.setFocus(true)
      else if key = "right" and press then
        m.global.r2c0.setFocus(false)
        m.global.r2c1.setFocus(true)
      else if key = "OK" and not m.global.r2c0Called then
        m.buttonClicked = true
        m.global.r2c0Called = true
        if(m.global.xPlayer) then
          m.global.r2c0.iconUri = "pkg:/images/X.jpg"
          m.global.xPlayer = false
        else
          m.global.r2c0.iconUri = "pkg:/images/O.jpg"
          m.global.xPlayer = true
        end if
        Winning()
      end if
    else if m.global.r2c1.hasFocus() then
      if key = "up" and press then
        m.global.r2c1.setFocus(false)
        m.global.r1c1.setFocus(true)
      else if key = "left" and press then
        m.global.r2c1.setFocus(false)
        m.global.r2c0.setFocus(true)
      else if key = "right" and press then
        m.global.r2c1.setFocus(false)
        m.global.r2c2.setFocus(true)
      else if key = "OK" and not m.global.r2c1Called then
        m.buttonClicked = true
        m.global.r2c1Called = true
        if(m.global.xPlayer) then
          m.global.r2c1.iconUri = "pkg:/images/X.jpg"
          m.global.xPlayer = false
        else
          m.global.r2c1.iconUri = "pkg:/images/O.jpg"
          m.global.xPlayer = true
        end if
        Winning()
      end if
    else if m.global.r2c2.hasFocus() then
      if key = "up" then
        m.global.r2c2.setFocus(false)
        m.global.r1c2.setFocus(true)
      else if key = "left" and press then
        m.global.r2c2.setFocus(false)
        m.global.r2c1.setFocus(true)
      else if key = "OK" and not m.global.r2c2Called then
        m.buttonClicked = true
        m.global.r2c2Called = true
        if(m.global.xPlayer) then
          m.global.r2c2.iconUri = "pkg:/images/X.jpg"
          m.global.xPlayer = false
        else
          m.global.r2c2.iconUri = "pkg:/images/O.jpg"
          m.global.xPlayer = true
        end if
        Winning()
      end if
    end if
  ' end if

'shows if the player is switching
  if(m.global.xPlayer) then
    m.global.playerNotify.text = "Player X's Turn"
  else
    m.global.playerNotify.text = "Player O's Turn"
  end if
  ' Winning()

'   if m.global.r0c0.iconUri = "pkg:/images/X.jpg" and m.global.r0c1.iconUri = "pkg:/images/X.jpg" and m.global.r0c2.iconUri = "pkg:/images/X.jpg" then
'       m.global.Horizontal_Line_Top.visible = "true"
'       m.global.playerNotify.text = "Player X wins"   '-

'     else if m.global.xPlayer and m.global.r1c0.iconUri = "pkg:/images/X.jpg" and m.global.r1c1.iconUri = "pkg:/images/X.jpg" and m.global.r1c2.iconUri = "pkg:/images/X.jpg" then
'       m.global.Horizontal_Line_Middle.visible = "true"
'       m.global.playerNotify.text = "Player X wins" '-

'     else if m.global.xPlayer and m.global.r2c0.iconUri = "pkg:/images/X.jpg" and m.global.r2c1.iconUri = "pkg:/images/X.jpg" and m.global.r2c2.iconUri = "pkg:/images/X.jpg" then
'       m.global.Horizontal_Line_Bottom.visible = "true"
'       m.global.playerNotify.text = "Player X wins" '-

'     else if m.global.xPlayer and m.global.r0c0.iconUri = "pkg:/images/X.jpg" and m.global.r1c0.iconUri = "pkg:/images/X.jpg" and m.global.r2c0.iconUri = "pkg:/images/X.jpg" then
'       m.global.Vertical_Line_Top.visible = "true"
'       m.global.playerNotify.text = "Player X wins" '|

'     else if m.global.xPlayer and m.global.r0c1.iconUri = "pkg:/images/X.jpg" and m.global.r1c1.iconUri = "pkg:/images/X.jpg" and m.global.r2c1.iconUri = "pkg:/images/X.jpg" then
'       m.global.Vertical_Line_Middle.visible = "true"
'       m.global.playerNotify.text = "Player X wins" '|

'     else if m.global.xPlayer and m.global.r0c2.iconUri = "pkg:/images/X.jpg" and m.global.r1c2.iconUri = "pkg:/images/X.jpg" and m.global.r2c2.iconUri = "pkg:/images/X.jpg" then
'       m.global.Vertical_Line_Bottom.visible = "true"
'       m.global.playerNotify.text = "Player X wins" '|

'     else if m.global.xPlayer and m.global.r0c0.iconUri = "pkg:/images/X.jpg" and m.global.r1c1.iconUri = "pkg:/images/X.jpg" and m.global.r2c2.iconUri = "pkg:/images/X.jpg" then
'       m.global.diagonalWin1.visible = "true"
'       m.global.playerNotify.text = "Player X wins" '\

'     else if m.global.xPlayer and m.global.r0c2.iconUri = "pkg:/images/X.jpg" and m.global.r1c1.iconUri = "pkg:/images/X.jpg" and m.global.r2c0.iconUri = "pkg:/images/X.jpg" then
'       m.global.diagonalWin2.visible = "true"      
'       m.global.playerNotify.text = "Player X wins" '/

'     end if 

' 'for O player
' 'for each if else if statment, add a reset function after the visible function
'     if not m.global.xPlayer and m.global.r0c0.iconUri = "pkg:/images/O.jpg" and m.global.r0c1.iconUri = "pkg:/images/O.jpg" and m.global.r0c2.iconUri = "pkg:/images/O.jpg" then
'       m.global.Horizontal_Line_Top.visible = "true"
'       m.global.playerNotify.text = "Player O wins"   '-

'     else if not m.global.xPlayer and m.global.r1c0.iconUri = "pkg:/images/O.jpg" and m.global.r1c1.iconUri = "pkg:/images/O.jpg" and m.global.r1c2.iconUri = "pkg:/images/O.jpg" then
'       m.global.Horizontal_Line_Middle.visible = "true"
'       m.global.playerNotify.text = "Player O wins" '-

'     else if not m.global.xPlayer and m.global.r2c0.iconUri = "pkg:/images/O.jpg" and m.global.r2c1.iconUri = "pkg:/images/O.jpg" and m.global.r2c2.iconUri = "pkg:/images/O.jpg" then
'       m.global.Horizontal_Line_Bottom.visible = "true"
'       m.global.playerNotify.text = "Player O wins" '-

'     else if not m.global.xPlayer and m.global.r0c0.iconUri = "pkg:/images/O.jpg" and m.global.r1c0.iconUri = "pkg:/images/O.jpg" and m.global.r2c0.iconUri = "pkg:/images/O.jpg" then
'       m.global.Vertical_Line_Top.visible = "true"  
'       m.global.playerNotify.text = "Player O wins" '|

'     else if not m.global.xPlayer and m.global.r0c1.iconUri = "pkg:/images/O.jpg" and m.global.r1c1.iconUri = "pkg:/images/O.jpg" and m.global.r2c1.iconUri = "pkg:/images/O.jpg" then
'       m.global.Vertical_Line_Middle.visible = "true"
'       m.global.playerNotify.text = "Player O wins" '|

'     else if not m.global.xPlayer and m.global.r0c2.iconUri = "pkg:/images/O.jpg" and m.global.r1c2.iconUri = "pkg:/images/O.jpg" and m.global.r2c2.iconUri = "pkg:/images/O.jpg" then
'       m.global.Vertical_Line_Bottom.visible = "true"
'       m.global.playerNotify.text = "Player O wins" '|

'     else if not m.global.xPlayer and m.global.r0c0.iconUri = "pkg:/images/O.jpg" and m.global.r1c1.iconUri = "pkg:/images/O.jpg" and m.global.r2c2.iconUri = "pkg:/images/O.jpg" then
'       m.global.diagonalWin1.visible = "true"
'       m.global.playerNotify.text = "Player O wins" '\

'     else if not m.global.xPlayer and m.global.r0c2.iconUri = "pkg:/images/O.jpg" and m.global.r1c1.iconUri = "pkg:/images/O.jpg" and m.global.r2c0.iconUri = "pkg:/images/O.jpg" then
'       m.global.diagonalWin2.visible = "true"
'       m.global.playerNotify.text = "Player O wins" '/

'     end if 

  
  return false
end function

function Winning()
'x player
'for each if else if statment, add a reset function after the visible function
  if not m.global.xPlayer then
    if m.global.r0c0.iconUri = "pkg:/images/X.jpg" and m.global.r0c1.iconUri = "pkg:/images/X.jpg" and m.global.r0c2.iconUri = "pkg:/images/X.jpg" then
      m.global.Horizontal_Line_Top.visible = true
      m.global.playerNotifytext = "Player X wins"   '-

    else if m.global.r1c0.iconUri = "pkg:/images/X.jpg" and m.global.r1c1.iconUri = "pkg:/images/X.jpg" and m.global.r1c2.iconUri = "pkg:/images/X.jpg" then
      m.global.Horizontal_Line_Middle.visible = true
      m.global.playerNotify.text = "Player X wins" '-

    else if m.global.r2c0.iconUri = "pkg:/images/X.jpg" and m.global.r2c1.iconUri = "pkg:/images/X.jpg" and m.global.r2c2.iconUri = "pkg:/images/X.jpg" then
      m.global.Horizontal_Line_Bottom.visible = true
      m.global.playerNotify.text = "Player X wins" '-

    else if m.global.r0c0.iconUri = "pkg:/images/X.jpg" and m.global.r1c0.iconUri = "pkg:/images/X.jpg" and m.global.r2c0.iconUri = "pkg:/images/X.jpg" then
      m.global.Vertical_Line_Top.visible = true
      m.global.playerNotify.text = "Player X wins" '|

    else if m.global.r0c1.iconUri = "pkg:/images/X.jpg" and m.global.r1c1.iconUri = "pkg:/images/X.jpg" and m.global.r2c1.iconUri = "pkg:/images/X.jpg" then
      m.global.Vertical_Line_Middle.visible = true
      m.global.playerNotify.text = "Player X wins" '|

    else if m.global.r0c2.iconUri = "pkg:/images/X.jpg" and m.global.r1c2.iconUri = "pkg:/images/X.jpg" and m.global.r2c2.iconUri = "pkg:/images/X.jpg" then
      m.global.Vertical_Line_Bottom.visible = true
      m.global.playerNotify.text = "Player X wins" '|

    else if m.global.r0c0.iconUri = "pkg:/images/X.jpg" and m.global.r1c1.iconUri = "pkg:/images/X.jpg" and m.global.r2c2.iconUri = "pkg:/images/X.jpg" then
      m.global.diagonalWin1.visible = true
      m.global.playerNotify.text = "Player X wins" '\

    else if m.global.r0c2.iconUri = "pkg:/images/X.jpg" and m.global.r1c1.iconUri = "pkg:/images/X.jpg" and m.global.r2c0.iconUri = "pkg:/images/X.jpg" then
      m.global.diagonalWin2.visible = true      
      m.global.playerNotify.text = "Player X wins" '/

    end if 
  end if

'for O player
'for each if else if statment, add a reset function after the visible function
    if m.global.xPlayer then
      if m.global.r0c0.iconUri = "pkg:/images/O.jpg" and m.global.r0c1.iconUri = "pkg:/images/O.jpg" and m.global.r0c2.iconUri = "pkg:/images/O.jpg" then
        m.global.Horizontal_Line_Top.visible = true
        m.global.playerNotify.text = "Player O wins"   '-

      else if m.global.r1c0.iconUri = "pkg:/images/O.jpg" and m.global.r1c1.iconUri = "pkg:/images/O.jpg" and m.global.r1c2.iconUri = "pkg:/images/O.jpg" then
        m.global.Horizontal_Line_Middle.visible = true
        m.global.playerNotify.text = "Player O wins" '-

      else if m.global.r2c0.iconUri = "pkg:/images/O.jpg" and m.global.r2c1.iconUri = "pkg:/images/O.jpg" and m.global.r2c2.iconUri = "pkg:/images/O.jpg" then
        m.global.Horizontal_Line_Bottom.visible = true
        m.global.playerNotify.text = "Player O wins" '-

      else if m.global.r0c0.iconUri = "pkg:/images/O.jpg" and m.global.r1c0.iconUri = "pkg:/images/O.jpg" and m.global.r2c0.iconUri = "pkg:/images/O.jpg" then
        m.global.Vertical_Line_Top.visible = true  
        m.global.playerNotify.text = "Player O wins" '|

      else if m.global.r0c1.iconUri = "pkg:/images/O.jpg" and m.global.r1c1.iconUri = "pkg:/images/O.jpg" and m.global.r2c1.iconUri = "pkg:/images/O.jpg" then
        m.global.Vertical_Line_Middle.visible = true
        m.global.playerNotify.text = "Player O wins" '|

      else if m.global.r0c2.iconUri = "pkg:/images/O.jpg" and m.global.r1c2.iconUri = "pkg:/images/O.jpg" and m.global.r2c2.iconUri = "pkg:/images/O.jpg" then
        m.global.Vertical_Line_Bottom.visible = true
        m.global.playerNotify.text = "Player O wins" '|

      else if m.global.r0c0.iconUri = "pkg:/images/O.jpg" and m.global.r1c1.iconUri = "pkg:/images/O.jpg" and m.global.r2c2.iconUri = "pkg:/images/O.jpg" then
        m.global.diagonalWin1.visible = true
        m.global.playerNotify.text = "Player O wins" '\

      else if m.global.r0c2.iconUri = "pkg:/images/O.jpg" and m.global.r1c1.iconUri = "pkg:/images/O.jpg" and m.global.r2c0.iconUri = "pkg:/images/O.jpg" then
        m.global.diagonalWin2.visible = true
        m.global.playerNotify.text = "Player O wins" '/

      end if
    end if
end function

' ? "[tictactoe] onKeyEvent", key, press
' m.currentFocus = m.top.hasFocused()
' m.currentRow = currentFocus.row
' m.currentCol = currentFocus.col

' if key = "down" and press and currentRow <> 2   then
'   gridComponents[currentRow+1][currentCol].setFocus(true)
' else if key = "up" and press and currentRow <> 0 then
'   gridComponents[currentRow-1][currentCol].setFocus(true)
' else if key = "left" and press and currentCol <> 2  then
'   gridComponents[currentRow][currentCol-1].setFocus(true)
' else if key = "right" and press and currentCol <> 0  then
'   gridComponents[currentRow][currentCol+1].setFocus(true)
' else if key = "OK" and press then
'   'Fix this
'   'Hi'
'   'gridComponents[currentRow][currentCol].visible = true
'   'next player turn
'   return false
' end if
' return false