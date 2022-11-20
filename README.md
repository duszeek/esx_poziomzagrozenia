# esx_poziomzagrozenia
<h3>Skrypt który ustawienie kodu in-game przekierowuje jako informacje na kanał discord w postaci wiadomości embed.</h3><br /><br />


W pliku server.lua wklejacie link do swojego webhooka
```lua
local webhook = "tu_wklejacie_link"
```
<br />

W miejscu **grade** ustawiacie najniżnszą możliwą rangę od której można ustawić dany kod w postaci numeru grade'a<br />
W miejscu **hookColor** wstawiacie kolor wiadomości embed w postaci **Decimal!!!**
```lua
Config.Info = {
    ["zielony"]     = {code = "zielony",    grade = 1, hookColor = "65310"}, 
    ["czerwony"]    = {code = "czerwony",   grade = 2, hookColor = "16711680"}, 
    ["czarny"]      = {code = "czarny",     grade = 5, hookColor = "0"}, 
} 
```

<h3>Wyglad wiadomosci:</h3>
https://imgur.com/dS4qVYu

