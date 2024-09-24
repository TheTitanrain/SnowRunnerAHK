isCCEnabled := 0
return

^w:: { ; нажатие (Control + w) для включения cruise control
    enableCC()
}

enableCC() {
    global isCCEnabled
    isCCEnabled := 1
    while (isCCEnabled) {
        ; Проверка, активно ли окно SnowRunner
        if !WinActive("ahk_class SnowRunner") {
            isCCEnabled := 0
            break
        }

        ; Проверка нажатия клавиши s для отмены круиз-контроля
        if GetKeyState("s", "P") { ; "P" для физического состояния
            isCCEnabled := 0
            break
        }

        ; Удерживаем клавишу "w" для круиз-контроля
        Send("{w down}")
        Sleep(10)
    }

    ; Отпускаем клавишу "w", когда круиз-контроль отключен
    Send("{w up}")
}
