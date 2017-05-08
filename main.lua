-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

-- Inclui a biblioteca de Widgets
local widget = require( "widget" )

-- Pega a largura da tela
local W = display.contentWidth
local WP = display.pixelWidth

-- Pega a altura da tela
local H = display.contentHeight
local HP = display.pixelHeight
 
--> Esconde o Status Bar
display.setStatusBar(display.HiddenStatusBar)


local vetorBotoes = {}
local numero1 = "0"
local numero2 = ""
local result = ""
local operacao = ""
local calc = 0
local verificador = 0

-- Cria um retangulo com a altura e largura em Pixel do dispositivo
local background = display.newRect(HP/4,HP/4,WP,HP)
-- Define a cor do retangulo.(Red, Green, Blue)
background:setFillColor(173 , 216 , 230)

-- Cria um retangulo com a altura e largura em Pixel do dispositivo
local resultado = display.newRect( 0, 0,WP,HP/4)
-- Define a cor do retangulo.(Red, Green, Blue)
resultado:setFillColor(0,0,255)


-- Mostra um texto na tela, passa como parâmetro o texto, a posição X, a posição Y, a fonte, e o tamanho da letra
local Calculadora = display.newText( numero1, WP/3, HP/35, native.systemFont, 30 )
-- Define uma cor para o texto (Red, Green, Blue)
Calculadora:setTextColor( 0, 255, 0 )

-- Mostra um texto na tela, passa como parâmetro o texto, a posição X, a posição Y, a fonte, e o tamanho da letra
local mostraOperacao = display.newText( operacao, WP/5, HP/15, native.systemFont, 30 )
-- Define uma cor para o texto (Red, Green, Blue)
mostraOperacao:setTextColor( 0, 255, 0 )


-- Mostra um texto na tela, passa como parâmetro o texto, a posição X, a posição Y, a fonte, e o tamanho da letra
local Calculadora2 = display.newText( numero2, WP/3, HP/15, native.systemFont, 30 )
-- Define uma cor para o texto (Red, Green, Blue)
Calculadora2:setTextColor( 0, 255, 0 )

if calc ~= 0 then
  -- Mostra um texto na tela, passa como parâmetro o texto, a posição X, a posição Y, a fonte, e o tamanho da letra
  local resultado = display.newText( result, WP/3, HP/10, native.systemFont, 30 )
  -- Define uma cor para o texto (Red, Green, Blue)
  resultado:setTextColor( 0, 255, 0 )
end


local function Calc() 
  
  if(operacao=="/")then
     if(numero2 ~= 0)then
        calc = tonumber(numero1) / tonumber(numero2) 
        
     end
  elseif (operacao == "X") then
      calc = tonumber(numero1) * tonumber(numero2) 
     
  elseif (operacao == "-") then
     calc = tonumber(numero1) - tonumber(numero2) 
     
  elseif (operacao == "+") then
     calc = tonumber(numero1) + tonumber(numero2) 
     
  elseif (operacao == "%") then 
      calc = tonumber(numero2) * ( tonumber(numero1) / 100)
      
  end
  
  result = calc
  resultado.text = result 
  if(verificador == 1) then
     mostraOperacao.text = operacao
  else
    mostraOperacao.text = "" 
    operacao = ""
  end
  
  Calculadora.text = calc
  Calculadora2.text = ""
  numero1 = calc
  numero2 = ""
  
  
end


-- Armazenando o tipo de operação

local function armazenaOperacao(op) 
   operacao = op
   
end


-- Realizando os Calculos
local function calcula(event)   
  if ( "ended" == event.phase ) then
    
    local posicao = event.target.id
    
    if(posicao == "C") then
      numero1 = "0"
      numero2 = ""
      result = ""
      operacao = ""
      calc = 0
      verificador = 0
      
      Calculadora.text = numero1 
      mostraOperacao.text = ""

      Calculadora2.text = numero2

      resultado.text = ""
      
      
    elseif (posicao == "CE") then
      
      numero2 = ""
      
    elseif (posicao == "DEL") then
      
    
    elseif(posicao=="=") then
      if ( (numero2 ~= "") and (operacao ~= "")    )then
         Calc ()
        operacao = "="
        mostraOperacao.text = operacao
       
      end
    
    elseif (operacao == "") then
      if ( (posicao == "%") or (posicao == "+") or (posicao == "-") or (posicao == "X") or (posicao == "/") )then
          mostraOperacao.text = posicao
          verificador = 1
          armazenaOperacao (posicao)
      else
          if(numero1=="0")then
            numero1 = posicao
          else
            numero1 = numero1..posicao
          end     
          Calculadora.text = numero1
                 
      end      
    else
      
      if ( (posicao == "%") or (posicao == "+") or (posicao == "-") or (posicao == "X") or (posicao == "/") )then
         if (numero2 ~= "")then           
            Calc ()  
            operacao = posicao
            mostraOperacao.text = posicao
          else
            operacao = posicao
            mostraOperacao.text = posicao
         end
      else
          if(numero2=="")then
            numero2 = posicao
          else
            numero2 = numero2..posicao
          end     
          Calculadora2.text = numero2
                 
      end   
    end
  end
end



local dados = {}
dados[1] = {"CE", "C", "DEL", "%"}
dados[2] = {"7","8","9","/"}
dados[3] = {"4","5","6","X"}
dados[4] = {"1","2","3","-"}
dados[5] = {",","0","=","+"}


local posTop =150
for i= 1, 5 do
  local posLeft = 20
  for j= 1, 4 do
     local button = widget.newButton(
    {
        -- Nome de Exibição do Botão
        label = dados[i][j],
        --onEvent = handleButtonEvent,
        emboss = false,
        -- Properties for a rounded rectangle button
        shape = "roundedRect",
        -- Posição da Esquerda
        left = posLeft,
        -- Posição do topo
        top = posTop,
        -- Largura de cada botão
        width = 60,
        -- Altura de cada Botão
        height = 50,
        id = dados[i][j],
        cornerRadius = 2,
        -- Cor de Fundo do Botão
       fillColor = { default={1,0,0,1}, over={1,0.1,0.7,0.4} },
        -- Sombreamento da borda do botão
       strokeColor = { default={1,0.4,0,1}, over={0.8,0.8,1,1} },
        -- Tamanho da Borda
        strokeWidth = 4,
  
       onEvent = calcula
          
        
      }
    )
    
    table.insert(vetorBotoes,button)
    
    posLeft = posLeft + 70
  
  end 
  posTop = posTop + 60 
  
end

