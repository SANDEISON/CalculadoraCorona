-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

-- Pega a largura da tela
W = display.contentWidth
WP = display.pixelWidth

-- Pega a altura da tela
H = display.contentHeight
HP = display.pixelHeight


-- Inclui a biblioteca de Widgets
local widget = require( "widget" )

--> Esconde o Status Bar
display.setStatusBar(display.HiddenStatusBar)




-- Cria um retangulo com a altura e largura em Pixel do dispositivo
local background = display.newRect(0,0,WP,HP)
-- Define a cor do retangulo.(Red, Green, Blue)
background:setFillColor(0,0,205)


-- Cria um retangulo com a altura e largura em Pixel do dispositivo
local resultado = display.newRect( 0, 0,WP,HP/3)
-- Define a cor do retangulo.(Red, Green, Blue)
resultado:setFillColor(255,0,0)

-- Mostra um texto na tela, passa como parâmetro o texto, a posição X, a posição Y, a fonte, e o tamanho da letra
local txCalculadora = display.newText( "Calculadora", WP/10, HP/30, native.systemFont, 15 )
-- Define uma cor para o texto (Red, Green, Blue)
txCalculadora:setTextColor( 0, 255, 0 )

-- Mostra um texto na tela, passa como parâmetro o texto, a posição X, a posição Y, a fonte, e o tamanho da letra
local txSoma = display.newText( "Resultado : ", WP/10, HP/7, native.systemFont, 15 )
-- Define uma cor para o texto (Red, Green, Blue)
txSoma:setTextColor( 0, 255, 0 )

local dados = {}
dados[1] = {"CE", "C", "DEL", "/"}
dados[2] = {"7","8","9","X"}
dados[3] = {"4","5","6","-"}
dados[4] = {"1","2","3","+"}
dados[5] = {"#","0",",","="}

local contI
local contJ = HP/5

for i = 1, 5 do
  contI = WP/30
  for j= 1, 4 do
    -- Insert a row into the tableView
    local button1 = widget.newButton(
    {
        -- Nome de Exibição do Botão
        label = dados[i][j],
        --onEvent = handleButtonEvent,
        emboss = false,
        -- Properties for a rounded rectangle button
        shape = "roundedRect",
        -- Posição da Esquerda
        left = contI,
        -- Posição do topo
        top = contJ ,
        -- Largura de cada botão
        width = WP/10,
        -- Altura de cada Botão
        height = HP/20,
        
        cornerRadius = 2,
        -- Cor de Fundo do Botão
        fillColor = { default={1,0,0,1}, over={1,0.1,0.7,0.4} },
        -- Sombreamento da borda do botão
        strokeColor = { default={1,0.4,0,1}, over={0.8,0.8,1,1} },
        -- Tamanho da Borda
        strokeWidth = 4
    }
  )
  contI = contI + (WP/9)
end
contJ = contJ + (HP/18)
end



