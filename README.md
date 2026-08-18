<h1 align="center">ETN LIB</h1>
<p align="center">Система модулей для Garry's Mod</p>

<h2>Установка</h2>
<ol>
  <li>Поместите скрипт в <code>lua/autorun/</code></li>
  <li>Создайте папку <code>lua/main</code> для ваших модулей или любой другой, изменив 61 строку на <code>loadModules("ваше название папки")</code></li>
  <li>Все <code>.lua</code> файлы из <code>main</code> загрузятся автоматически</li>
  <li>Важное уточнение: вы можете создавать несколько модулей, регистрируя их через <code>loadModules(path).</code> Это необходимо для контейнеризации кода</li>
</ol>

<h2>Использование</h2>
<pre><code>cl_hud.lua      — только клиент
sv_commands.lua — только сервер
sh_config.lua   — клиент и сервер</code></pre>
<p>Файлы без префикса загружаются как <code>sh_</code> (обе стороны).</p>
<p>Поддерживается рекурсивная загрузка из вложенных папок.</p>

<h2>Обработка ошибок</h2>
<pre><code>[ETN LIB | MODULE ERROR] Ошибка в: main/cl_hud.lua
attempt to call a nil value</code></pre>
<p>Остальные модули продолжат загружаться.</p>

<h2>Структура</h2>
<pre><code>lua/
├── autorun/
│   └── etn_lib.lua
└── main/
    ├── sh_config.lua
    ├── sv_init.lua
    ├── cl_hud.lua
    └── modules/
        └── sv_database.lua</code></pre>
