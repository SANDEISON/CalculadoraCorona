local widget = require( "widget" )
 
-- Function to handle button events
local function handleButtonEvent( event )
 
    if ( "ended" == event.phase ) then
        print( "Button was pressed and released" )
    end
end
 
local button1 = widget.newButton(
    {
        width = 240,
        height = 120,
        -- defaultFile = "img/Numero_1.png",
        -- overFile = "img/Numero_2.png",
        label = "button",
        onEvent = handleButtonEvent
    }
)
 
-- Center the button
button1.x = display.contentCenterX
button1.y = display.contentCenterY
 
-- Change the button's label text
button1:setLabel( "2-Image" )