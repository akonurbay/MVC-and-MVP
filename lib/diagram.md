## Архитектура MVC
UI Layer (TaskView)
      ↓ вызывает
Controller Layer (TaskController)
      ↓ работает с
Model Layer (TaskModel)

## Архитектура MVP
UI Layer (TaskMvpScreen)
      ↑↓ implements / вызывает
Presenter Layer (TaskPresenter)
      ↓ работает с
Model Layer (TaskModel)

## Ответственности
- UI Layer       — отображение данных, пользовательский ввод
- Controller     — логика, управляет моделью напрямую
- Presenter      — логика, общается с UI только через интерфейс
- Model          — данные, структура задачи