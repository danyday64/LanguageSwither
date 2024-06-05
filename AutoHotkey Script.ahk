; Загружаем раскладки клавиатуры
en := DllCall("LoadKeyboardLayout", "Str", "00000409", "Int", 1) ; Английская раскладка
ru := DllCall("LoadKeyboardLayout", "Str", "00000419", "Int", 1) ; Русская раскладка
jp := DllCall("LoadKeyboardLayout", "Str", "00000411", "Int", 1) ; Японская раскладка

; Инициализация переменных
currentLayout := en
previousLayout := ru

; Переключение языков на Alt + Shift
!Shift::
    SwitchLayout()
return

; Функция для переключения раскладки
SwitchLayout()
{
    global currentLayout, previousLayout, en, ru, jp
        if (currentLayout = en) {
            newLayout := ru
        } else if (currentLayout = ru) {
            newLayout := en
        } else {
            newLayout := ru
        }


    previousLayout := currentLayout
    currentLayout := newLayout
    SetLayout(newLayout)
}

; Функция для установки раскладки
SetLayout(language)
{
    ControlGetFocus, control, A
    PostMessage 0x50, 0, %language%, %control%, A ; WM_INPUTLANGCHANGEREQUEST
}



