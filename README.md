# MIPT Laboratory-based Works
В репозитории представлены некоторые лабораторные работы МФТИ - собственно те, которые были в моем маршруте.
## Структура директорий
- Каждая лаба находится в отдельной директории с именем "X.Y.Z (t)" для институских лаб и "Glass YZ (t)" для стекловских, где
  - X - номер семестра, причем начиная только с третьего.
  - Y.Z - номер лабы, указанной в лабнике
  - t - номер лабы в хронологическом порядке выполнения. Т.е. чем больше t, тем позже она была сделана.
- Внутри директории лабы принята следующая структура:
  - "Лабораторная работа X.Y.Z.*" - единственный обязательный файл (Кроме первых трех лаб). Представляет собственно результат выполнения лабы.
  - "Description X.Y.Z" - Директория или файл с описанием лабы. Может быть выдернуто из лабника, а может и сфотографированная методичка.
  - "Source" - Обычно в этой директории находятся готовые графики и рисунки установки.
  - "Data&Scripts" - В общем-то центральная часть лабы. Здесь находятся скрипты для MATLAB-а и данные. Эти скрипты могут сильно меняться с изменением номера t. Для некоторых лаб скрипты могут быть настолько плохими, что перестанут работать при изменении данных. Впрочем, если вы уже дошли до их использования - исправить это будет не проблемой.

## Основной шаблон
Выполнение любой лабы начинается с копирования основного шаблона - он находится в директории "0.0.0 (0)" и содержит всю структуру, указанную выше. Содержательная часть этого шаблона - это, конечно MATLAB-овские скрипты, которые постоянно обновлялись в угоду большей автоматизации процесса.
