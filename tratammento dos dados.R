# ==============================================================================
# ==============================================================================
#                          analise descritiva 
# ==============================================================================
# ==============================================================================


# carregando os pacotes 

library(tidyverse)
library(readxl)
# carregando o banco de dados 


dados<-read_excel('dados.xlsx')



# verificando fatores 


dados %>%
  dplyr::select(where(is.character)) %>% 
  glimpse()

temos apenas uma variavel do tipo texto que é a id = identificação

dados %>%
  dplyr::select(where(is.numeric)) %>% 
  glimpse()


# OBS:


sexo ,grupo e idade eestão como variaveis númericas ,vamos convertelas para fatores 


#(dados)[c(2,3)]<-as.factor(select(dados,Grupos,Sexo))

 
dados$Grupo<- as.factor(dados$Grupo)

dados$Idade<- as.factor(dados$Idade)


dados$Sexo <-as.factor(dados$Sexo)


#convertendo multiplos fatores de uma unica vez 

      
      
dados[21:24]<-  sapply(dados[21:24], as.factor)
      


dados %>%
  glimpse()



dados %>%
  select(where(is.na) )%>% 
  glimpse()


#valores faltantes NAs

 #subistituindo pela média 
dados[is.na(dados$lc),]
dados$LV[is.na(dados$LV)]<-round(mean(dados$LV, na.rm = T),2)

dados$LC[is.na(dados$LC)]<-round(mean(dados$LC, na.rm = T),2)


dados$LD[is.na(dados$LD)]<-round(mean(dados$LD, na.rm = T),2)
dados$LE[is.na(dados$LE)]<-round(mean(dados$LE, na.rm = T),2)
dados$LF[is.na(dados$LF)]<-round(mean(dados$LF, na.rm = T),2)
dados$LO[is.na(dados$LO)]<-round(mean(dados$LO, na.rm = T),2)


dados$AC[is.na(dados$AC)]<-round(mean(dados$AC, na.rm = T),2)

dados$AD[is.na(dados$AD)]<-round(mean(dados$AD, na.rm = T),2)

dados$AF[is.na(dados$AF)]<-round(mean(dados$AF, na.rm = T),2)

any(is.na(dados))


# salvando os dados editados 


write.csv(dados,'dados_trat.csv',row.names = FALSE)
