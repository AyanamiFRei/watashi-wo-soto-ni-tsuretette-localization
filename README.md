# わたしをそとにつれてって — RU / EN Localization

<p align="center">
  <img src="assets/Avatar_RU_1024.png" alt="Russian localization avatar" width="320">
  <img src="assets/Avatar_EN_1024.png" alt="English localization avatar" width="320">
</p>

<p align="center"><strong>by “Migdal Bavel” project.</strong></p>

Полная неофициальная русская и английская локализация визуальной новеллы **わたしをそとにつれてって**.

A complete unofficial Russian and English localization of the visual novel **わたしをそとにつれてって**.

- Steam App ID: `4879010`
- Проверенная сборка / Tested build: `24158896`
- Платформа / Platform: Windows, Steam
- [Последний релиз / Latest release](https://github.com/AyanamiFRei/watashi-wo-soto-ni-tsuretette-localization/releases/latest)
- [Название и описание для Steam / Steam title and description](STEAM_TITLE_DESCRIPTION_RU_EN.txt)
- [Полный текст Steam-руководства / Full Steam guide text](STEAM_GUIDE_RU_EN.txt)

---

## Русский

### Что переведено

- весь основной сценарий и развилки;
- меню, кнопки, варианты выбора и системные сообщения;
- поля ввода и проверка ответов;
- графические экраны телефона и финальная анкета;
- вступительные анимации и встроенный в изображения текст;
- шрифты с сохранением оригинальной пиксельной стилистики.

При адаптации сохранены исходные кнопки и их состояния, переходы, анимации, тайминги и геометрия экранов. Имена, роли персонажей и грамматический род сверены по контексту японского оригинала.

### Установка

1. Скачайте RU-архив со страницы [Releases](https://github.com/AyanamiFRei/watashi-wo-soto-ni-tsuretette-localization/releases/latest).
2. Полностью закройте игру.
3. Распакуйте архив в отдельную папку.
4. Запустите `Установить русификатор.cmd`.
5. Подтвердите автоматически найденную папку Steam либо введите другой путь.
6. Дождитесь завершения пересборки и проверки `app.asar`.

Пакет содержит только изменённые файлы. Установщик использует Electron из установленной игры, поэтому дополнительные программы и интернет-соединение не требуются. На диске с игрой временно потребуется около 1,5 ГБ свободного места.

Для возврата японской версии запустите `Восстановить оригинал.cmd`.

---

## English

### What is localized

- the complete main story and its branches;
- menus, buttons, choices, and system messages;
- input fields and answer validation;
- phone graphics and the final profile screens;
- intro animations and text baked into images;
- fonts matching the original pixel-art style.

The adaptation preserves the original buttons and their states, transitions, animations, timing, and screen geometry. Character names, roles, and grammatical gender were checked against the context of the Japanese original.

### Installation

1. Download the EN archive from [Releases](https://github.com/AyanamiFRei/watashi-wo-soto-ni-tsuretette-localization/releases/latest).
2. Close the game completely.
3. Extract the archive to a separate folder.
4. Run `Install English patch.cmd`.
5. Accept the automatically detected Steam folder or enter another path.
6. Wait for `app.asar` rebuilding and verification to finish.

The package contains only modified files. The installer uses the Electron runtime bundled with the installed game, so no additional software or internet connection is required. About 1.5 GB of temporary free space is needed on the game drive.

Run `Restore original.cmd` to return to the Japanese version.

---

## Repository structure / Структура репозитория

- `Russian_Patch/` — файлы русификатора и установщик;
- `English_Patch/` — English localization files and installer;
- `assets/` — RU/EN project avatars;
- `STEAM_TITLE_DESCRIPTION_RU_EN.txt` — готовые двуязычные название и описание для Steam;
- `STEAM_GUIDE_RU_EN.txt` — полный двуязычный текст Steam-руководства в BBCode;
- `docs/` — release notes and avatar-generation notes.

Large localized GIF animations are stored through Git LFS. Release ZIP files are attached to GitHub Releases rather than committed to the repository.

Крупные локализованные GIF-анимации хранятся через Git LFS. ZIP-архивы для пользователей прикрепляются к GitHub Releases и не коммитятся в репозиторий.

## Reporting issues / Сообщения об ошибках

При сообщении о пропущенном тексте или ошибке перевода приложите скриншот и кратко укажите момент игры.

When reporting untranslated text or a translation issue, attach a screenshot and briefly identify the scene.

## Disclaimer / Правовая информация

This is an unofficial fan project. An installed Steam copy of the game is required. See [NOTICE.md](NOTICE.md).

Это неофициальный фанатский проект. Для использования необходима установленная копия игры в Steam. Подробности: [NOTICE.md](NOTICE.md).
