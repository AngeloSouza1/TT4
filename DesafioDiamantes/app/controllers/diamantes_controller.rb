class DiamantesController < ApplicationController
    def extrair_diamantes
      expressao = "<<.<<..>><>><.>.>.<<.>.<.>>>><>><>>"
      @expressao = expressao.gsub(/</, '&lt;').gsub(/>/, '&gt;').html_safe
      @resultado = extrair_diamantes_e_areias(expressao)
      render 'extrair_diamantes'
    end
  
    private
  
    def extrair_diamantes_e_areias(expressao)
      diamantes = 0
      areias = 0
  
      i = 0
      while i < expressao.length
        if expressao[i] == '<' && expressao[i + 1] == '>'
          expressao[i..i + 1] = ''
          diamantes += 1
          i -= 1
        elsif expressao[i] == '.'
          expressao[i] = ''
          areias += 1
          i -= 1
        end
  
        i += 1
      end
  
      { diamantes: diamantes, areias: areias }
    end
  end
  