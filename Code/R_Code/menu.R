install.packages('KoNLP')
install.packages('tm')
install.packages("stringr")
install.packages("data.table")
install.packages("readxl")
install.packages("dplyr")
install.packages("xlsx")
library(KoNLP)
library(tm)
library(stringr)
library(data.table)
library(readxl)
library(dplyr)
library(xlsx)

#전처리, 특수문자 삭제 data <- read_excel("menu.xlsx")
data <- data.frame(data)
data.nospace <- data.frame(gsub(' ', '', data$품명))
colnames(data.nospace)[which(names(data.nospace) == "gsub..........data.품명.")] <- "품명"
data.remove <- str_remove_all(data.nospace$품명,"-")
data.remove <- data.frame(data.remove)
colnames(data.remove)[which(names(data.remove) == "data.remove")] <- "품명"
data.remove <- str_remove_all(data.remove$품명, "[[:punct:]]")
data.remove <- data.frame(data.remove)
data.replace <- str_replace_all(data.remove$data.remove, "外", "외")
data.replace <- data.frame(data.replace)
data.replace <- gsub("｜", "", data.replace$data.replace)
data.replace <- data.frame(data.replace)
data.replace <- gsub("\\^", "", data.replace$data.replace)
data.replace <- data.frame(data.replace)
data.replace <- gsub("◆", "", data.replace$data.replace)
data.replace <- data.frame(data.replace)
data.replace <- gsub("◈", "", data.replace$data.replace)
data.replace <- data.frame(data.replace)
data.replace <- gsub("★", "", data.replace$data.replace)
data.replace <- data.frame(data.replace)
data.replace <- gsub("▶", "", data.replace$data.replace)
data.replace <- data.frame(data.replace)
data.replace <- gsub("◀", "", data.replace$data.replace)
data.replace <- data.frame(data.replace)
data.replace <- gsub("●", "", data.replace$data.replace)
data.replace <- data.frame(data.replace)
data.replace <- gsub("~", "", data.replace$data.replace)
data.replace <- data.frame(data.replace)
data.replace <- gsub("☆", "", data.replace$data.replace)
data.replace <- data.frame(data.replace)
data.replace <- gsub("♠", "", data.replace$data.replace)
data.replace <- data.frame(data.replace)
data.replace <- gsub("　", "", data.replace$data.replace)
data.replace <- data.frame(data.replace)
data.replace <- gsub("\\|", "", data.replace$data.replace)
data.replace <- data.frame(data.replace)
data.replace <- gsub("\\+", "", data.replace$data.replace)
data.replace <- data.frame(data.replace)
data.replace <- gsub("㉧", "", data.replace$data.replace)
data.replace <- data.frame(data.replace)
data.test <- data.frame(data.replace)
data.table <- table(data.test)
write.table(data.table, "table.txt")

#관리비
data.test <- gsub('[[:digit:]]{1,}년[[:digit:]]{1,}월관리비','관리비', data.test$data.replace)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{1,}월분관리비','관리비', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{1,}호[[:digit:]]{1,}월관리비', '관리비', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{1,}[[:alpha:]]{1,}관리비{1,}외{0,}', '관리비', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{1,}관리비', '관리비', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{1,}년{1,}[[:digit:]]{1,}월{,1}관리{1,}[[:alpha:]]{0,}', '관리비', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{2,}[[:alpha:]]{1,}관리비{1,}[[:alpha:]]{0,}', '관리비', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('관리비{1,}[[:digit:]]{3,}호{1,}', '관리비', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('관리비{1,}[[:alpha:]]{1,}', '관리비', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('관리비{1,}[[:digit:]]{1,}', '관리비', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('운영관리비월', '관리비', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('비과세관리비', '관리비', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}관리비{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '관리비', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, "table(관리비).txt")

#수도료
data.test <- gsub('[[:digit:]]{1,}월{1,}분{0,}수도{1,}[[:alpha:]]{0,}', '수도료', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{1,}[[:alpha:]]{1,}[[:digit:]]{1,}[[:alpha:]]{1,}수도{1,}[[:alpha:]]{1,}', '수도료', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{1,}[[:alpha:]]{1,}수도{1,}[[:alpha:]]{0,}', '수도료', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('수도{1,}[[:alpha:]]{0,}', '수도료', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('수도료{1,}[[:alpha:]]{1,}', '수도료', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('수도료{1,}[[:digit:]]{1,}', '수도료', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:alpha:]]{1,}수도료{1,}', '수도료', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('수도료월', '수도료', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('수도료{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '수도료', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, "table(수도료).txt")

#음식물수거비
data.test <- gsub('[[:digit:]]{1,}[[:alpha:]]{1,}음식{1,}[[:alpha:]]{1,}', '음식물수거비', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{1,}년{1,}음식{1,}[[:alpha:]]{1,}', '음식물수거비', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('음식{1,}[[:alpha:]]{1,}', '음식물수거비', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('음식물수거비{1,}[[:digit:]]{1,}[[:alpha:]]{1,}', '음식물수거비', data.test$data.test)
data.test <- data.frame(data.test)
#잔반->음식물수거비
data.test <- gsub('잔반{1,}[[:alpha:]]{1,}', '음식물수거비', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, "table(음식물수거).txt")

#토지계약금
data.test <- gsub('[[:digit:]]{1,}호{1,}[[:alpha:]]{1,}[[:digit:]]{0,}[[:alpha:]]{1,}토지분{1,}', '토지계약금', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, "table(토지계약금).txt")

#비과세
data.test <- gsub('[[:digit:]]{1,}[[:alpha:]]{1,}비과세{1,}[[:alpha:]]{0,}', '비과세', data.test$data.test)
data.test <- data.frame(data.test)
date.test <- gsub('[[:digit:]]{1,}년{1,}비과세', '비과세', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{4,}년비과세', '비과세', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, "table(비과세).txt")

#전기료/전력기금
data.test <- gsub('[[:digit:]]{1,}[[:alpha:]]{1,}전기료{1,}[[:alpha:]]{1,}', '전력기금', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{1,}[[:alpha:]]{1,}전력기금{1,}[[:alpha:]]{0,}', '전력기금', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('전력기금외', '전력기금', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, "table(전력기금).txt")

#리스료
data.test <- gsub('[[:digit:]]{1,}[[:alpha:]]{2,}리스료{1,}[[:digit:]]{2,}[[:alpha:]]{1,}[[:digit:]]{4,}', '리스료', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{2,}[[:alpha:]]{1,}[[:digit:]]{5,}[[:alpha:]]{2,}리스료{1,}', '리스료', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{4,}년{1,}[[:digit:]]{2,}월{1,}리스{1,}[[:digit:]]{2,}[[:alpha:]]{1,}[[:digit:]]{4,}', '리스료', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('리스료{1,}[[:alpha:]]{2,}[[:digit:]]{2,}[[:alpha:]]{1,}[[:digit:]]{4,}', '리스료', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:alpha:]]{2,}리스료{1,}', '리스료', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('월리스료', '리스료', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('운용리스자산오토원화', '리스료', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, "table(리스료).txt")

#농산물
data.test <- gsub('[[:digit:]]{1,}[[:alpha:]]{1,}농산물{1,}[[:alpha:]]{0,}', '농산물', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, "table(농산물).txt")

#매출액
data.test <- gsub('[[:digit:]]{6,}월매출{1,}', '매출액', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{2,}[[:alpha:]]{2,}[[:digit:]]{1,}[[:alpha:]]{1,}매출', '매출액', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{4,}[[:alpha:]]{1,}매출', '매출액', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{1,}[[:alpha:]]{1,}매출', '매출액', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:alpha:]]{3,}매출', '매출액', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:alpha:]]{2,}[[:digit:]]{2,}[[:alpha:]]{1,}[[:digit:]]{1,}[[:alpha:]]{1,}매출[[:alpha:]]{2,}', '매출액', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('매출[[:alpha:]]{2,}', '매출액', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, "table(매출액).txt")


#보험료
data.test <- gsub('[[:digit:]]{1,}[[:alpha:]]{2,}보험료{1,}[[:alpha:]]{2,}', '보험료', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{2,}[[:alpha:]]{1,}[[:digit:]]{1,}[[:alpha:]]{2,}보험료{1,}[[:alpha:]]{0,}', '보험료', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:alpha:]]{2,}보험료{1,}[[:alpha:]]{0,}','보험료', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, "table(보험료).txt")

#소독
data.test <- gsub('[[:digit:]]{2,}[[:alpha:]]{1,}소독{1,}[[:alpha:]]{1,}', '소독', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:alpha:]]{2,}소독{1,}', '소독', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('소독{1,}[[:alpha:]]{1,}[[:digit:]]{0,}', '소독', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, "table(소독).txt")

#도서대금
data.test <- gsub('[[:alpha:]]{2,}도서{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '도서대금', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('도서{1,}[[:alpha:]]{0,}', '도서대금', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{1,}[[:alpha:]]{1,}도서대{1,}', '도서대금', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('도서대금{1,}[[:alpha:]]{1,}', '도서대금', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('2억빚을진내게우주님이가르쳐준', '도서대금', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(도서대금).txt')

#연유(서울우유연유때문에 우유보다 연유가 먼저 올것)
data.test <- gsub('[[:alpha:]]{2,}연유{1,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '연유', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('연유{1,}[[:alpha:]]{1,}[[:digit:]{1,}[[:alpha:]]{1,}', '연유', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(연유).txt')

#우유(서울우유연유때문에 우유는 연우이후에 정리할것)
data.test <- gsub('[[:alpha:]]{1,}우유{1,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '우유', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{1,}우유{1,}', '우유', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('우유{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '우유', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('ESL{1,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '우유', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:alpha:]]{0,}밀크{1,}', '우유', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(우유).txt')

#거래계
data.test <- gsub('[[:digit:]]{2,}거래계{1,}', '거래계', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(거래계).txt')

#검사비
data.test <- gsub('[[:digit:]]{4,}[[:alpha:]]{1,}[[:digit:]]{2,}[[:alpha:]]{2,}검사비{1,}[[:alpha:]]{0,}', '검사비', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(검사비).txt')

#야채(쌀 야채 -> 야채)
data.test <- gsub('[[:alpha:]]{1,}야채{1,}[[:alpha:]]{1,}', '야채', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('야채{1,}[[:alpha:]]{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '야채', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:alpha:]]{0,}[[:digit:]]{1,}[[:alpha:]]{1,}야채{1,}[[:alpha:]]{0,}', '야채', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:alpha:]]{0,}[[:digit:]]{0,}야채{1,}', '야채', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(야채).txt')

#계란
data.test <- gsub('[[:digit:]]{1,}대란{1,}[[:digit:]]{1,}[[:alpha:]]{1,}', '계란', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('계란{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '계란', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:alpha:]]{0,}계란{1,}', '계란', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:alpha:]]{0,}유정란{1,}[[:alpha:]]{0,}', '계란', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:alpha:]]{0,}대란{1,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '계란', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('초란{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '계란', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('달걀{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '계란', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('특란', '계란',data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('판란계란', '계란', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:alpha:]]{0,}계란{1,}', '계란', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('영양란{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '계란', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(계란).txt')

#오징어
data.test <- gsub('[[:digit:]]{1,}[[:alpha:]]{1,}[[:digit:]]{0,}오징어{1,}[[:alpha:]]{0,}', '오징어', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{1,}[[:alpha:]]{1,}오징어{1,}', '오징어', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:alpha:]]{1,}오징어{1,}[[:alpha:]]{0,}', '오징어', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('오징어{1,}[[:digit:]]{0,}[[:alpha:]]{1,}', '오징어', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:alpha:]]{1,}오징어{1,}[[:digit:]]{1,}[[:alpha:]]{1,}', '오징어', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('오징어{1,}[[:digit:]]{1,}[[:alpha:]]{1,}', '오징어', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(오징어).txt')

#명태
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}명태{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}명태{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '명태', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('명태{1,}[[:alpha:]]{0,}', '명태', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:alpha:]]{0,}명태{1,}[[:alpha:]]{0,}', '명태', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(명태).txt')

#콩나물
data.test <- gsub('[[:alpha:]]{0,}콩나{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}',
                  '콩나물', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(콩나물).txt')

#연어
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}연어{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '연어', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(연어).txt')

#갈비
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}갈비{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '갈비', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(갈비).txt')

#갈매기살
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}갈매기살{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '갈매기살', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(갈매기살).txt')

#삼겹살
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}삼겹살{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '삼겹살', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}삼겹{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '삼겹살', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(삼겹살).txt')

#돈정육
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}돈정육{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '돈정육', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}돈육{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '돈정육', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}돈장족{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '돈정육', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(돈정육).txt')

#목살
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}목살{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '목살', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(목살).txt')

#목전지
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}목전지{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '목전지', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('목전지{1,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '목전지', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(목전지).txt')

#쇠고기,소고기
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}쇠고기{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '쇠고기', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{3,}[[:alpha:]]{1,}TENDERLOIN{1,}[[:alpha:]]{2,}', '쇠고기', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('CHUCKEYEROLL{1,}[[:alpha:]]{2,}', '쇠고기', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('STRIPLOIN{1,}[[:alpha:]]{2,}', '쇠고기', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('깐양{1,}[[:alpha:]]{0,}', '쇠고기', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:alpha:]]{0,}와규{1,}[[:alpha:]]{0,}[[:digit:]]{0,}', '쇠고기', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:alpha:]]{0,}살치살{1,}[[:alpha:]]{0,}', '쇠고기', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:alpha:]]{0,}부채스테이크{1,}[[:alpha:]]{0,}', '쇠고기', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:alpha:]]{0,}비프{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '쇠고기', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:alpha:]]{0,}볼라블레이드{1,}[[:alpha:]]{0,}', '쇠고기', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('소꼬리{1,}[[:alpha:]]{0,}', '쇠고기', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('소불고기{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '쇠고기', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('쇠고기{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '쇠고기', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('수입소{1,}[[:alpha:]]{0,}', '쇠고기', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('소부산물', '소고기', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('알목심{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '쇠고기', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('우육불고기{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '쇠고기', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('우뒷사태{1,}[[:alpha:]]{0,}', '쇠고기', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('우육외', '쇠고기', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('육우우둔{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '쇠고기', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:alpha:]]{0,}BEEF{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '쇠고기', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(쇠고기).txt')

#밀가루
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}밀가루{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '밀가루', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:alpha:]]{0,}밀가루{1,}', '밀가루', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('밀가루{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '밀가루', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('밀가루{1,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '밀가루', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('밁루외', '밀가루', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('박력외', '밀가루', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('에땅듀럼세몰리나4KG', '밀가루', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('해표중력{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '밀가루', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(밀가루).txt')

#딸기
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}딸기{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '딸기', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:alpha:]]{2,}STRAWBERRIES{1,}[[:digit:]]{1,}[[:alpha:]]{1,}', '딸기', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(딸기).txt')

#아몬드
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}아몬드{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '아몬드', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:alpha:]]{2,}ALMONDS{1,}[[:digit:]]{3,}[[:alpha:]]{2,}', '아몬드', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(아몬드).txt')

#양파
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}양파{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '양파', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('양파{1,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '양파', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(양파).txt')

#한우
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}한우{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '한우', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:alpha:]]{0,}한우{1,}', '한우', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(한우).txt')

#김치
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}김치{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '김치', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:alpha:]]{0,}김치{1,}', '김치', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(김치).txt')

#식자재
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}식자재{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '식자재', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(식자재).txt')

#고등어
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}고등어{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '고등어', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('고등어{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '고등어', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('자반{1,}[[:alpha:]]{0,}[[:digit:]]{0,}', '고등어', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(고등어).txt')

#계육
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}계육{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '계육', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('계육{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '계육', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}닭{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '계육', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('닭{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '계육', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(계육).txt')

#강력분
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}강력{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '강력분', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('강력{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '강력분', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(강력분).txt')

#고춧가루
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}고추가루{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '고춧가루', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('고추가루{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '고춧가루', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}고춧가루{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '고춧가루', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('고춧가루{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '고춧가루', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(고춧가루).txt')

#면세
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}면세{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '면세', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('면세{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '면세', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(면세).txt')

#마늘
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}마늘{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '마늘', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('마늘{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '마늘', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(마늘).txt')

#단무지
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}단무지{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '단무지', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('단무지{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '단무지', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('단무지{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '단무지', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(단무지).txt')

#대게
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}대게{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '대게', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('대게{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '대게', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(대게).txt')

#수산물
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}수산물{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '수산물', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('수산물{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '수산물', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('냉동수산문ㄹ', '수산물', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(수산물).txt')

#호박
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}호박{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '호박', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('호박{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '호박', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('쥬키니{1,}[[:alpha:]]{1,}', '호박', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(호박).txt')

#활어
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}활어{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '활어', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('활어{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '활어', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(활어).txt')

#후추
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}후추{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '후추', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('후추{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '후추', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:alpha:]]{0,}후추{1,}', '후추', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(후추).txt')

#흑돼지
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}흑돼지{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '흑돼지', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('흑돼지{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '흑돼지', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(흑돼지).txt')

#참다랑어
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}참다랑어{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '참다랑어', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('참다랑어{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '참다랑어', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(참다랑어).txt')

#오돌뼈
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}오돌뼈{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '오돌뼈', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('오돌뼈{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '오돌뼈', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(오돌뼈).txt')

#우목심
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}우목심{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '우목심', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('우목심{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '우목심', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('우목심{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '우목심', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(우목심).txt')

#정육
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}정육{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '정육', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('정육{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '정육', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('정육{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '정육', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(정육).txt')

#황태
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}황태{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '황태', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('황태{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '황태', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('황태{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '황태', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(황태).txt')

#피망
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}피망{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '피망', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('피망{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '피망', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('피망{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '피망', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(피망).txt')

#토시살
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}토시살{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '토시살', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('토시살{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '토시살', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('토시살{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '토시살', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(토시살).txt')

#축산물
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}축산물{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '축산물', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('축산물{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '축산물', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('축산물{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '축산물', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(축산물).txt')

#청과
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}청과{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '청과', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('청과{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '청과', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('청과{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '청과', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(청과).txt')

#청경채
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}청경채{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '청경채', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('청경채{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '청경채', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('청경채{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '청경채', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(청경채).txt')

#채먹태
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}채먹태{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '채먹태', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('채먹태{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '채먹태', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('채먹태{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '채먹태', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(채먹태).txt')

#절단육
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}절단육{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '절단육', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('절단육{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '절단육', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('절단육{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '절단육', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(절단육).txt')

#채소
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}채소{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '채소', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('채소{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '채소', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('채소{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '채소', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(채소).txt')

#청양고추
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}청양고추{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '청양고추', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('청양고추{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '청양고추', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('청양고추{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '청양고추', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(청양고추).txt')

#농산물
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}농산물{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '농산물', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('농산물{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '농산물', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('농산물{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '농산물', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('농산무', '농산물', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('농산믈', '농산물', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(농산물).txt')

#대파
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}대파{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '대파', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('대파{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '대파', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('대파{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '대파', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(대파).txt')

#마감
data.test <- gsub('마감{1,}[[:digit:]]{0,}', '마감', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(마감).txt')

#냉동돈등심
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}냉동돈등심{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '냉동돈등심', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('냉동돈등심{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '냉동돈등심', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('냉동돈등심{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '냉동돈등심', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(냉동돈등심).txt')

#파슬리
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}파슬리{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '파슬리', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('파슬리{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '파슬리', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('파슬리{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '파슬리', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(파슬리).txt')

#토마토
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}토마토{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '토마토', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('토마토{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '토마토', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('토마토{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '토마토', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(토마토).txt')

#망고
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}망고{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '망고', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('망고{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '망고', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('망고{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '망고', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(태국망고).txt')

#천일염
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}천일염{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '천일염', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('천일염{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '천일염', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('천일염{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '천일염', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(천일염).txt')

#감자
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}감자{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '감자', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('감자{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '감자', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('감자{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '감자', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(감자).txt')

#감초
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}감초{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '감초', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('감초{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '감초', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('감초{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '감초', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(감초).txt')

#고기류
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}고기류{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '고기류', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('고기류{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '고기류', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('고기류{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '고기류', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(고기류).txt')

#곱창
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}곱창{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '곱창', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('곱창{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '곱창', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('곱창{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '곱창', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(곱창).txt')

#광어
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}광어{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '광어', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('광어{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '광어', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('광어{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '광어', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(광어).txt')

#미역
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}미역{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '미역', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('미역{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '미역', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('미역{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '미역', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(미역).txt')

#꽃소금
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}꽃소금{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '꽃소금', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('꽃소금{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '꽃소금', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('꽃소금{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '꽃소금', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(꽃소금).txt')

#깍두기
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}깍두기{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '깍두기', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('깍두기{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '깍두기', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('깍두기{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '깍두기', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(깍두기).txt')

#낙지
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}낙지{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '낙지', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('낙지{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '낙지', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('낙지{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '낙지', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(낙지).txt')

#배추
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}배추{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '배추', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('배추{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '배추', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('배추{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '배추', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}배추{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '배추', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(배추).txt')

#버섯
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}버섯{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '버섯', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('버섯{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '버섯', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('버섯{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '버섯', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:alpha:]]{0,}버섯{1,}', '버섯', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(버섯).txt')

#도미
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}도미{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '도미', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('도미{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '도미', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('도미{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '도미', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(도미).txt')

#돈등심
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}돈등심{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '돈등심', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('돈등심{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '돈등심', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('돈등심{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '돈등심', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(돈등심).txt')

#돈뼈
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}돈뼈{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '돈뼈', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('돈뼈{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '돈뼈', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('돈뼈{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '돈뼈', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(돈뼈).txt')

#등심
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}등심{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '등심', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('등심{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '등심', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('등심{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '등심', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(등심).txt')

#레몬
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}레몬{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '레몬', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('레몬{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '레몬', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('레몬{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '레몬', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(레몬).txt')

#무순
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}무순{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '무순', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('무순{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '무순', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('무순{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '무순', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(무순).txt')

#무말랭이
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}무말랭이{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '무말랭이', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('무말랭이{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '무말랭이', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('무말랭이{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '무말랭이', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(무말랭이).txt')

#물품대금
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}물품{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '물품', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('물품{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '물품', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('물품{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '물품', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(물품).txt')

#무쌈
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}무쌈{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '무쌈', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('무쌈{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '무쌈', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('무쌈{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '무쌈', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(무쌈).txt')

#문어
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}문어{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '문어', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('문어{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '문어', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('문어{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '문어', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(문어).txt')

#바지락
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}바지락{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '바지락', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('바지락{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '바지락', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('바지락{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '바지락', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(바지락).txt')

#부채살
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}부채살{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '부채살', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('부채살{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '부채살', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('부채살{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '부채살', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(부채살).txt')

#부추
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}부추{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '부추', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('부추{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '부추', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('부추{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '부추', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(부추).txt')

#항정살
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}항정살{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '항정살', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('항정살{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '항정살', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('항정살{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '항정살', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(항정살).txt')

#해물
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}해물{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '해물', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('해물{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '해물', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('해물{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '해물', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(해물).txt')

#홍합
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}홍합{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '홍합', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('홍합{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '홍합', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('홍합{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '홍합', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(홍합).txt')

#호두
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}호두{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '호두', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('호두{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '호두', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('호두{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '호두', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(호두).txt')

#새우
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}새우{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '새우', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('새우{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '새우', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('새우{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '새우', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(새우).txt')

#나물
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}나물{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '나물', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('나물{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '나물', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('나물{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '나물', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(나물).txt')

#오이
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}오이{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '오이', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('오이{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '오이', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('오이{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '오이', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:alpha:]]{0,}오이{1,}', '오이', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}오이{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '오이', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(오이).txt')

#키위
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}키위{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '키위', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('키위{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '키위', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('키위{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '키위', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(키위).txt')

#참외
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}참외{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '참외', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('참외{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '참외', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('참외{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '참외', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(참외).txt')

#파래
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}파래{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '파래', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('파래{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '파래', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('파래{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '파래', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(파래).txt')

#한치
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}한치{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '한치', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('한치{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '한치', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('한치{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '한치', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('한치{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '한치', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(한치).txt')

#장어
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}장어{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '장어', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('장어{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '장어', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('장어{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '장어', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(장어).txt')

#참치
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}참치{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '참치', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('참치{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '참치', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('참치{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '참치', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(참치).txt')

#젓갈
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}젓갈{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '젓갈', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('젓갈{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '젓갈', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('젓갈{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '젓갈', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(젓갈).txt')

#꽃게
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}꽃게{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '꽃게', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('꽃게{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '꽃게', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('꽃게{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '꽃게', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(꽃게).txt')

#건어물
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}건어물{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '건어물', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('건어물{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '건어물', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('건어물{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '건어물', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(건어물).txt')

#키위
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}키위{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '키위', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('키위{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '키위', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('키위{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '키위', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(키위).txt')

#곶감
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}곶감{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '곶감', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('곶감{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '곶감', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('곶감{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '곶감', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(곶감).txt')

#후지
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}후지{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '후지', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('후지{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '후지', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('후지{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '후지', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(후지).txt')

#떡볶기
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}떡볶기{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '떡볶기', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('떡볶기{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '떡볶기', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('떡볶기{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '떡볶기', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(떡볶기).txt')

#교재대금
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}교재{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '교재', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('교재{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '교재', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('교재{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '교재', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(교재).txt')

#근위
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}근위{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '근위', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('근위{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '근위', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('근위{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '근위', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(근위).txt')

#방제
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}방제{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '방제', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('방제{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '방제', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('방제{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '방제', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(방제).txt')

#국수나무
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}국수나무{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '국수나무', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('국수나무{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '국수나무', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('국수나무{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '국수나무', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(국수나무).txt')

#잡육
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}잡육{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '잡육', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('잡육{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '잡육', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('잡육{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '잡육', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(잡육).txt')

#쭈꾸미
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}주꾸미{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '쭈꾸미', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('주꾸미{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '쭈꾸미', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('쭈꾸미{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '쭈꾸미', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:alpha:]]{1,}쭈꾸미{1,}[[:digit:]]{1,}[[:alpha:]]{0,}', '쭈꾸미', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(쭈꾸미).txt')

#지대미
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}지대미{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '지대미', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('지대미{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '지대미', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('지대미{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '지대미', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(지대미).txt')

#조기
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}조기{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '조기', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('조기{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '조기', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('조기{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '조기', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(조기).txt')

#기타
data.test <- gsub('101비과', '기타', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('105', '기타', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('106', '기타', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('111', '기타', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('1120', '기타', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{4,}년{1,}[[:digit:]]{2,}월{1,}', '기타', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{4,}년{1,}[[:digit:]]{2,}월분{1,}', '기타', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{1,}월분{1,}', '기타', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('9호15각국내산외', '기타', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('9호외', '기타', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{4,}년산{1,}[[:digit:]]{2,}kg{1,}', '기타', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('결국컨셉{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '기타', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('기타{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '기타', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('민찌외34', '기타', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('분외', '기타', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('불당동곡간{1,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}', '기타', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('빙빙반점3월10012012000', '기타', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('서래갈매기{1,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}', '기타', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('수강후기집', '기타', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('수선유지비및잡비', '기타', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('시소외', '기타', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('애플민트{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '기타', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('외야구{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '기타', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('이슈토론', '기타', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('자연품은봉', '기타', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('족장{1,}[[:digit:]]{0,}호{1,}[[:alpha:]]{0,}', '기타', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('중등가맹{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '기타', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('초도세트다비수', '기타', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('최상품대금2베트남산', '기타', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('축양{1,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '기타', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('케냐{1,}[[:alpha:]]{0,}', '기타', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('큐사이야시장{1,}[[:digit:]]{1,}월{1,}[[:digit:]]{1,}월{1,}[[:digit:]]{1,}월{1,}[[:digit:]]{1,}', '기타', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('클래식s', '기타', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('콤팩타화분', '기타', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('포도당함수결정벌크대상20kg외2건', '기타', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('품목일괄외', '기타', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('피닉스', '기타', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(기타).txt')

#교육
data.test <- gsub('[[:digit:]]{5}[[:alpha:]]{0,}교육{1,}', '교육', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('Core{1,}[[:alpha:]]{0,}[[:digit:]]{2,}[[:alpha:]]{1,}', '교육', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('DevelopmentCorse{1,}[[:digit:]]{2,}[[:alpha:]]{1,}', '교육', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('GrammarWorksIntermediate1', '교육', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('강의하는{1,}[[:alpha:]]{0,}', '교육', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('비상플러스러닝수강권', '교육', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('참고서{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '교육', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('행복한논술초등', '교육', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(교육).txt')

#양곡대금
data.test <- gsub('[[:digit:]]{1,}[[:alpha:]]{1,}양곡대금{1,}', '양곡대금', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(양곡대금).txt')

#계산서
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}계산서{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '계산서', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(계산서).txt')

#참깨
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}참깨{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '참깨', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(참깨).txt')

#생두
data.test <- gsub('[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}생두{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '생두', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:alpha:]]{0,}1718FineCup{1,}', '생두', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(생두).txt')

#영화관람
data.test <- gsub('[[:alpha:]]{0,}영화관람{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '영화관람', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(영화관람).txt')

#생리대
data.test <- gsub('[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}생리대{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '생리대', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:alpha:]]{0,}위스퍼{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '생리대', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:alpha:]]{0,}화이트{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '생리대', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:alpha:]]{0,}좋은느낌{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '생리대', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(생리대).txt')

#판매대금 data.test <- gsub('[[:alpha:]]{0,}판매대금{1,}', '판매대금', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(판매대금).txt')

#VBC시스템
data.test <- gsub('VBC시스템', 'VBC시스템', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(VBC시스템).txt')

#신고배
data.test <- gsub('[[:alpha:]]{0,}신고배{1,}[[:alpha:]]{0,}', '신고배', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(신고배).txt')

#참두릅
data.test <- gsub('[[:alpha:]]{0,}참두릅{1,}[[:alpha:]]{0,}', '참두릅', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(참두릅).txt')

#가공식품
data.test <- gsub('[[:alpha:]]{0,}가공식품{1,}[[:alpha:]]{0,}', '가공식품', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(가공식품).txt')

#가지
data.test <- gsub('[[:alpha:]]{0,}가지{1,}[[:alpha:]]{0,}', '가지', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(가지).txt')

#생강
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}생강{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '생강', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(생강).txt')

#강도다리
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}강도다리{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '강도다리', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(강도다리).txt')

#고급제면용
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}고급제면용{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '고급제면용', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(고급제면용).txt')

#고무장갑
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}고무장갑{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '고무장갑', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('고무장갑{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '고무장갑', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(고무장갑).txt')

#고사리
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}고사리{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '고사리', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(고사리).txt')

#고추씨
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}고추씨{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '고추씨', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(고추씨).txt')

#고추
data.test <- gsub('고추외', 
                  '고추', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(고추).txt')

#골뱅이
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}골뱅이{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '골뱅이', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(골뱅이).txt')

#과일
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}과일{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '과일', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(과일).txt')

#돈부산물
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}돈부산물{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '돈부산물', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(돈부산물).txt')

#통발
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}통발{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '통발', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(통발).txt')

#염통
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}염통{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '염통', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(염통).txt')

#녹두
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}녹두{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '녹두', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(녹두).txt')

#김가루
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}김가루{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '김가루', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(김가루).txt')

#김밥김
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}김밥김{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '김밥김', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(김밥김).txt')

#김칫속
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}김칫속{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '김칫속', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(김칫속).txt')

#은행
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}은행{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '은행', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(은행).txt')

#쪽파
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}쪽파{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '쪽파', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(쪽파).txt')

#팥
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}팥{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '팥', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(팥).txt')

#깨소금
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}깨소금{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '깨소금', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(깨소금).txt')

#깻잎
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}깻잎{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '깻잎', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('깻잎{1,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '깻잎', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(깻잎).txt')

#사과
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}사과{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '사과', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(사과).txt')

#날치알
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}날치알{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '날치알', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(날치알).txt')

#필증스티커
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}필증스티커{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '필증스티커', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(필증스티커).txt')

#물류대금
data.test <- gsub('물류', '물류대금', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}물류대금{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '물류대금', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(물류대금).txt')

#블루베리
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}블루베리{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '블루베리', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(블루베리).txt')

#농수산
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}농수산{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '농수산', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(농수산).txt')

#눈다랑어
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}눈다랑어{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '눈다랑어', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:alpha:]]{0,}복육{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '눈다랑어', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('눈머리{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '눈다랑어', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(눈다랑어).txt')

#당근
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}당근{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '당근', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('당근{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '당근', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(당근).txt')

#바나나
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}바나나{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '바나나', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(바나나).txt')

#대창
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}대창{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '대창', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(대창).txt')

#더초이스
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}더초이스{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '더초이스', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(더초이스).txt')

#돈두
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}돈두{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '돈두', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(돈두).txt')

#돈막창
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}돈막창{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '돈막창', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(돈막창).txt')

#돈안심
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}돈안심{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '돈안심', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(돈안심).txt')

#돈앞다리
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}돈앞다리{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '돈앞다리', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('앞다리{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '돈앞다리', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:alpha:]]{0,}돈앞다리{1,}[[:alpha:]]{0,}', '돈앞다리'
                  , data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:alpha:]]{0,}앞다리', '돈앞다리', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(돈앞다리).txt')

#돈채
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}돈채{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '돈채', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(돈채).txt')

#돌김
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}돌김{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '돌김', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(돌김).txt')

#돌미나리
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}돌미나리{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '돌미나리', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(돌미나리).txt')

#쌀
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}신동진{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '쌀', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}청결미{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '쌀', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}일반미{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '쌀', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}지대미{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '쌀', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}찰기장{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '쌀', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}쌀{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '쌀', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('쌀{1,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '쌀', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('옥토진미{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '쌀', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}토시미{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '쌀', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}풍광수토{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '쌀', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}행복한밥상{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '쌀', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}행복한햇살{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '쌀', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('경기미외', '쌀', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(쌀).txt')

#동태
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}동태{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '동태', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(동태).txt')

#두부
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}두부{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '두부', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('두부{1,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '두부', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(두부).txt')

#둥굴레
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}둥굴레{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '둥굴레', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(둥굴레).txt')

#뒷다리
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}뒷다리{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '뒷다리', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(뒷다리).txt')

#땅콩가루
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}땅콩가루{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '땅콩가루', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(땅콩가루).txt')

#과자
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}과자{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '과자', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(과자).txt')

#막창
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}막창{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '막창', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(막창).txt')

#맛기름
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}맛기름{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '맛기름', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(맛기름).txt')

#꽃돔
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}만다이{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '꽃돔', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(꽃돔).txt')

#먹태
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}먹태{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '먹태', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(먹태).txt')

#메로가마살
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}메로가마살{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '메로가마살', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(메로가마살).txt')

#메추리알
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}메추리알{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '메추리알', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(메추리알).txt')

#멸치
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}멸치{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '멸치', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(멸치).txt')

#명란
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}명란{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '명란', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(명란).txt')

#돼지고기
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}이베리코{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '돼지고기', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}한돈{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '돼지고기', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(돼지고기).txt')

#몬스터매스제품
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}몬스터매스제품{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '몬스터매스제품', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(몬스터매스제품).txt')

#무생채
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}무생채{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '무생채', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(무생채).txt')

#무우
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}무우{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '무우', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('무외', '무우', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(무우).txt')

#묵은지
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}묵은지{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '묵은지', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(묵은지).txt')

#미나리
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}미나리{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '미나리', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(미나리).txt')

#민물고기
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}민물고기{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '민물고기', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(민물고기).txt')

#밀크마스터
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}마스터1000{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '밀크마스터', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(밀크마스터).txt')

#바퀴벌레
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}바퀴벌레{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '바퀴벌레', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(바퀴벌레).txt')

#배달대행료
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}배달대행료{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '배달대행료', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(배달대행료).txt')

#배(과일)
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}알뜰배{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '배', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('배외', '배', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(배).txt')

#백미
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}백미{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '백미', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(백미).txt')

#복권
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}복권{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '복권', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(복권).txt')

#봉지무
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}봉지무{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '봉지무', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(봉지무).txt')

#종량제봉투
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}종량제봉투{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '종량제봉투', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(종량제봉투).txt')

#부산물
data.test <- gsub('부산물외', '부산물', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(부산물).txt')

#부식
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}부식{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '부식', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(부식).txt')

#북채
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}북채{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '북채', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('북채{1,}[[:digit:]{0,}[[:alpha:]]{0,}', '북채', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(북채).txt')

#수수료
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}수수료{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '수수료', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(수수료).txt')

#삼치
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}삼치{1,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '삼치', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('삼치{1,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', '삼치', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(삼치).txt')

#오뎅
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}오뎅{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '오뎅', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(오뎅).txt')

#상품대그
data.test <- gsub('상품[[:alpha:]]{0,}', '상품대금', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:alpha:]]{0,}상품대금', '상품대금', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(상품대금).txt')

#새송이
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}새송이{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '새송이', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(새송이).txt')

#생선
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}생선{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '생선', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(생선).txt')

#선어
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}선어{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '선어', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(선어).txt')

#생크림
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}생크림{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '생크림', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(생크림).txt')

#소금
data.test <- gsub('소금{1,}[[:alpha:]]{0,}', '소금', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(소금).txt')

#라임
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}라임{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '라임', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(라임).txt')

#들깨
data.test <- gsub('들개', '들깨', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}들깨{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '들깨', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(들깨).txt')

#오렌지
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}오렌지{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '오렌지', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(오렌지).txt')

#수수
data.test <- gsub('수수[[:digit:]]{1,}[[:alpha:]]{0,}', '수수', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(수수).txt')

#수입육
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}수입육{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '수입육', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(수입육).txt')

#청포도
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}청포도{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '청포도', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(청포도).txt')

#숙주
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}숙주{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '숙주', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(숙주).txt')

#상추
data.test <- gsub('상추{1,}[[:alpha:]]{1,}', '상추', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(상추).txt')

#생굴
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}생굴{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '생굴', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(생굴).txt')

#소맥
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}소맥{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '소맥', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(소맥).txt')

#스티커북
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}스티커북{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '스티커북', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(스티커북).txt')

#샐러리
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}샐러리{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '샐러리', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(샐러리).txt')

#우거지
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}우거지{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '우거지', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(우거지).txt')

#식료품
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}식료품{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '식료품', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(식료품).txt')

#식육
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}식육{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '식육', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(식육).txt')

#식잡외
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}식잡외{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '식잡외', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(식잡외).txt')

#식품
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}식품{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '식품', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(식품).txt')

#신문구독료
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}구독료{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '구독료', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(구독료).txt')

#신선육
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}신선육{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '신선육', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(신선육).txt')

#수거비
data.test <- gsub('수거비', '수거비', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(수거비).txt')

#식재료
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}식재료{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '식재료', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(식재료).txt')

#빵가루
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}빵가루{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '빵가루', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(빵가루).txt')

#아이비피토시
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}아이비피토시{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '아이비피토시', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(아이비피토시).txt')

#알탕
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}알탕{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '알탕', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(알탕).txt')

#양고기
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}양고기{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '양고기', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}양어깨살{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '양고기', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}양숄더랙{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '양고기', data.test$data.test)
data.test <- data.frame(data.test)
data.test <- gsub('양고기{1,}[[:digit:]]{0,}[[:alpha:]]{0,}', '양고기', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(양고기).txt')

#양곡
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}양곡{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '양곡', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(양곡).txt')

#양념
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}양념{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '양념', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(양념).txt')

#어패류
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}어패류{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '어패류', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(어패류).txt')

#얼음
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}얼음{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '얼음', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(얼음).txt')

#양상추
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}양상추{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '양상추', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(양상추).txt')

#오감
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}오감{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '오감', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(오감).txt')

#오겹살
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}오겹살{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '오겹살', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(오겹살).txt')

#오죽잎
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}오죽잎{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '오죽잎', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(오죽잎).txt')

#옥수수가루
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}옥수수가루{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '옥수수가루', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(옥수수가루).txt')

#온라인
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}온라인{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '온라인사용료', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(온라인사용료).txt')

#육계
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}육계{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '육계', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(육계).txt')

#유제품
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}유제품{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '유제품', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(유제품).txt')

#유기농어린잎
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}유기농어린잎{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '유기농어린잎', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(유기농어린잎).txt')

#육류대금
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}육류{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '육류대금', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(육류대금).txt')

#육수용
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}육수{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '육수용', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(육수용).txt')

#육제품
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}육제품{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '육제품', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(육제품).txt')

#소스
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}소스{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '소스', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(소스).txt')

#건포류
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}건포류{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '건포류', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(건포류).txt')

#견과류
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}견과류{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '견과류', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(견과류).txt')

#자몽
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}자몽{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '자몽', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(자몽).txt')

#인건비
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}인건비{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '인건비', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(인건비).txt')

#일회용품
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}일회용품{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '일회용품', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(일회용품).txt')

#장족외
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}장족외{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '장족외', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(장족외).txt')

#쇼핑용봉투
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}쇼핑용봉투{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '쇼핑용봉투', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(쇼핑용봉투).txt')

#적상추
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}적상추{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '적상추', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(적상추).txt')

#적채
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}적채{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '적채', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(적채).txt')

#전족
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}전족{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '전족', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(전족).txt')

#절각육
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}절각육{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '절각육', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(절각육).txt')

#절단비
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}절단비{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '절단비', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(절단비).txt')

#절단육
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}절단육{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '절단육', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(절단육).txt')

#족발
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}족발{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '족발', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(족발).txt')

#공병
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}공병{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '공병', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(공병).txt')

#제육
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}제육{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '제육', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(제육).txt')

#코다리
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}코다리{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '코다리', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(코다리).txt')

#제품대
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}제품대{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '제품대', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(제품대).txt')

#꽁치
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}꽁치{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '꽁치', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(꽁치).txt')

#숭어
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}숭어{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '숭어', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(숭어).txt')

#천혜향
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}천혜향{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '천혜향', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(천혜향).txt')

#치즈
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}치즈{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '치즈', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(치즈).txt')

#치커리
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}치커리{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '치커리', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(치커리).txt')

#치킨무
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}치킨무{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '치킨무', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(치킨무).txt')

#포도
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}포도{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '포도', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(포도).txt')

#택배
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}택배{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '택배', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(택배).txt')

#통깨
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}통깨{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '통깨', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(통깨).txt')

#킹크랩
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}킹크랩{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '킹크랩', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(킹크랩).txt')

#케이크
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}케이크{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '케이크', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(케이크).txt')

#파인애플
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}파인애플{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '파인애플', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(파인애플).txt')

#파프리카
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}파프리카{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '파프리카', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(파프리카).txt')

#파채
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}파채{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '파채', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(파채).txt')

#팜플렛
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}팜플렛{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '팜플렛', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(팜플렛).txt')

#패류
data.test <- gsub('패류', '패류', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(킹크랩).txt')

#폐기물수거료
data.test <- gsub('폐기물수거료', '폐기물수거료', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(킹크랩).txt')

#풋고추
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}풋고추{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '풋고추', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(풋고추).txt')

#가슴살
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}가슴살{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '가슴살', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(가슴살).txt')

#한라봉
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}한라봉{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '한라봉', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(한라봉).txt')

#해바라기씨
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}해바라기씨{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '해바라기씨', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(해바라기씨).txt')

#흑미
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}흑미{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '흑미', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(흑미).txt')

#홍메기
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}홍메기{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '홍메기', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(홍메기).txt')

#감말랭이
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}감말랭이{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '감말랭이', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(감말랭이).txt')

#후라이드
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}후라이드{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '후라이드', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(후라이드).txt')

#혼합곡
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}혼합{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '혼합곡', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(혼합곡).txt')

#동화책판매대금
data.test <- gsub('[[:digit:]]{0,}[[:alpha:]]{0,}동화책판매대금{1,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}[[:digit:]]{0,}[[:alpha:]]{0,}', 
                  '동화책판매대금', data.test$data.test)
data.test <- data.frame(data.test)
data.table <- table(data.test)
write.table(data.table, 'table(동화책판매대금).txt')

#출력
colnames(data.test)[which(names(data.test) == "data.test")] <- "키워드"
data.test3 <- cbind(data,data.test)
data.test4 <- data.test3[c(1:2)]
write.xlsx(data.test, file='C:/Users/fight/OneDrive/Documents/menu/subject.xlsx',
           sheetName = '품명', 
           row.names=FALSE)

